import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../blocs.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final WishlistRepository _wishlistRepository;
  StreamSubscription? _authSubscription;
  StreamSubscription? _wishlistSubscription;

  final AuthBloc _authBloc;

  WishlistBloc({
    required AuthBloc authBloc,
    required WishlistRepository wishlistRepository,
  })  : _wishlistRepository = wishlistRepository,
        _authBloc = authBloc,
        super(WishlistLoading()) {
    on<UpdateWishList>((event, emit) => _onUpdateWishList(event, emit));
    on<LoadWishList>((event, emit) => _onLoadWishList(event, emit));
    on<AddProductToWishList>(
        (event, emit) => _onAddProductToWishList(event, emit));
    on<RemoveProductFromWishList>(
        (event, emit) => _onRemoveProductFromWishList(event, emit));

    _authSubscription = _authBloc.stream.listen(
      (state) {
        if (state.status == AuthStatus.unauthenticated) {
          add(UpdateWishList(user: User.empty));
        } else {
          _wishlistSubscription?.cancel();
          add(UpdateWishList(user: state.user));
        }
      },
    );
  }

  void _onLoadWishList(LoadWishList event, Emitter<WishlistState> emit) {
    emit(WishlistLoaded());
  }

  void _onUpdateWishList(event, Emitter<WishlistState> emit) {
    emit(WishlistLoaded(user: event.user));
  }

  Future<void> _onAddProductToWishList(
      event, Emitter<WishlistState> emit) async {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        // emit(WishlistLoading());
        await _wishlistRepository.updateProduct(event.product);

        emit(WishlistLoaded(
            user: event.user, product: event.product, action: 'add'));
      } catch (error) {
        print(error.toString());
      }
    }
  }

  Future<void> _onRemoveProductFromWishList(
      event, Emitter<WishlistState> emit) async {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        // emit(WishlistLoading());
        await _wishlistRepository.updateProduct(event.product);

        emit(WishlistLoaded(
            user: event.user, product: event.product, action: 'remove'));
      } catch (error) {
        print(error.toString());
      }
    }
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    _wishlistSubscription?.cancel();
    return super.close();
  }
}
