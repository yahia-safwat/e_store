import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../blocs.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final checkoutformKey = GlobalKey<FormState>();

  final AuthBloc _authBloc;
  final CartBloc _cartBloc;

  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _authSubscription;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _paymentSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc({
    required AuthBloc authBloc,
    required CartBloc cartBloc,
    required CheckoutRepository checkoutRepository,
  })  : _authBloc = authBloc,
        _cartBloc = cartBloc,
        _checkoutRepository = checkoutRepository,
        super(
          cartBloc.state is CartLoaded
              ? CheckoutLoaded(
                  orderId: Uuid().v1(),
                  orderCode: Uuid().v1().substring(0, 8),
                  user: authBloc.state.user,
                  customerName: '',
                  customerPhone: '',
                  customerAddress: '',
                  customerCity: '',
                  products: (cartBloc.state as CartLoaded).cart.products,
                  deliveryFee: cartBloc.deliveryFee().toStringAsFixed(0),
                  subtotal: cartBloc.subTotal.toStringAsFixed(0),
                  total: cartBloc.total().toStringAsFixed(0),
                  discount: '0',
                  createdAt: DateTime.now(),
                )
              : CheckoutLoading(),
        ) {
    on<UpdateCheckout>(_onUpdateCheckout);
    on<ConfirmCheckout>(_onConfirmCheckout);

    _authSubscription = _authBloc.stream.listen(
      (state) {
        if (state.status == AuthStatus.unauthenticated) {
          add(UpdateCheckout(user: User.empty));
        } else {
          add(UpdateCheckout(user: state.user));
        }
      },
    );

    _cartSubscription = _cartBloc.stream.listen(
      (state) {
        if (state is CartLoaded) {
          add(UpdateCheckout(cart: state.cart));
        }
      },
    );
  }

  void _onUpdateCheckout(
    UpdateCheckout event,
    Emitter<CheckoutState> emit,
  ) {
    final uuid = Uuid().v1();
    if (state is CheckoutLoaded) {
      final state = this.state as CheckoutLoaded;
      print('ssssssssssssssssssssssssssss');
      print(state.products);
      print('ssssssssssssssssssssssssssss');

      emit(
        CheckoutLoaded(
          orderId: uuid,
          orderCode: uuid.substring(0, 8),
          user: event.user ?? state.user,
          customerName: event.user?.fullName ?? state.user?.fullName,
          customerPhone: event.user?.phone ?? state.user?.phone,
          customerAddress: event.user?.address ?? state.user?.address,
          customerCity: event.user?.city ?? state.user?.city,
          products: event.cart?.products ?? state.products,
          deliveryFee: _cartBloc.deliveryFee().toStringAsFixed(0),
          subtotal: _cartBloc.subTotal.toStringAsFixed(0),
          total: _cartBloc.total().toStringAsFixed(0),
          discount: '0',
          createdAt: DateTime.now(),
        ),
      );
    }
  }

  void _onConfirmCheckout(
    ConfirmCheckout event,
    Emitter<CheckoutState> emit,
  ) async {
    final state = this.state;
    _checkoutSubscription?.cancel();
    if (state is CheckoutLoaded) {
      try {
        emit(CheckoutLoading());
        await _checkoutRepository.addCheckout(event.checkout);
        print('Done');
        emit(CheckoutLoaded(products: state.products));
      } catch (_) {}
    }
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    _cartSubscription?.cancel();
    _paymentSubscription?.cancel();
    return super.close();
  }
}
