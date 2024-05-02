import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/cart_model.dart';
import '../../../data/models/product_model.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repositories/repositories.dart';
import '../blocs.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AuthBloc _authBloc;
  StreamSubscription? _authSubscription;

  final UserRepository _userRepository;

  int sizeIndex = 0;

  CartBloc({
    required AuthBloc authBloc,
    required UserRepository userRepository,
  })  : _authBloc = authBloc,
        _userRepository = userRepository,
        super(CartLoading()) {
    on<LoadCart>((event, emit) => _onLoadCart(event, emit));
    on<AddProductToCart>((event, emit) => _onAddProduct(event, emit));
    on<RemoveProductFromCart>((event, emit) => _onRemoveProduct(event, emit));
    on<RemoveProductsFromCart>((event, emit) => _onRemoveProducts(event, emit));
    on<SetSizeToProduct>((event, emit) => _onSetSizeToProduct(event, emit));
    on<ClearCart>((event, emit) => _clearCart(event, emit));

    _authSubscription = _authBloc.stream.listen(
      (state) {
        if (state.status == AuthStatus.authenticated) {
          add(LoadCart(user: _authBloc.state.user));
        } else {
          add(LoadCart(user: User.empty));
        }
      },
    );
  }

  _onLoadCart(event, Emitter<CartState> emit) {
    emit(CartLoading());
    try {
      emit(CartLoaded(user: event.user));
    } catch (erroe) {}
  }

  _onAddProduct(AddProductToCart event, Emitter<CartState> emit) {
    final state = this.state;

    if (state is CartLoaded) {
      try {
        final List<Product> oldUserCart = List<Product>.from(
            _authBloc.state.user!.cart.map((x) => Product.fromMap(x)));

        final List<Product> products = List.from(oldUserCart)
          ..add(event.product);

        final List<Map<String, dynamic>> newUserCart =
            products.map((e) => e.toCartMap()).toList();

        _authBloc.state.user?.cart.clear();
        _authBloc.state.user?.cart.addAll(newUserCart);
        _userRepository.updateUser(_authBloc.state.user!);

        emit(CartLoaded(
            cart: Cart(products: products), user: _authBloc.state.user!));
      } catch (error) {
        print('------------(oldUserCart)-------------');
        print(error.toString());
        print('----------------(end)--------------');
      }
    }
  }

  _onRemoveProduct(event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        final List<Product> oldUserCart = List<Product>.from(
            _authBloc.state.user!.cart.map((x) => Product.fromMap(x)));

        final List<Product> products = List.from(oldUserCart)
          ..remove(event.product);

        final List<Map<String, dynamic>> newUserCart =
            products.map((e) => e.toCartMap()).toList();

        _authBloc.state.user?.cart.clear();
        _authBloc.state.user?.cart.addAll(newUserCart);
        _userRepository.updateUser(_authBloc.state.user!);

        emit(CartLoaded(
            cart: Cart(products: products), user: _authBloc.state.user!));
      } catch (error) {}
    }
  }

  _onRemoveProducts(event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        final List<Product> oldUserCart = List<Product>.from(
            _authBloc.state.user!.cart.map((x) => Product.fromMap(x)));

        final List<Product> products = List.from(oldUserCart)
          ..removeWhere((product) => product.sizes == event.product.sizes);

        final List<Map<String, dynamic>> newUserCart =
            products.map((e) => e.toCartMap()).toList();

        _authBloc.state.user?.cart.clear();
        _authBloc.state.user?.cart.addAll(newUserCart);
        _userRepository.updateUser(_authBloc.state.user!);

        emit(CartLoaded(
            cart: Cart(products: products), user: _authBloc.state.user!));
      } catch (error) {
        print(error.toString());
      }
    }
  }

  _clearCart(event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        final List<Product> products = [];

        final User? user = _authBloc.state.user;

        user!.cart.clear();
        user.cart.addAll(products.map((product) => product.toCartMap()));
        _userRepository.updateUser(user);

        emit(CartLoaded(
            cart: Cart(products: products), user: _authBloc.state.user!));
      } catch (error) {
        print(error.toString());
      }
    }
  }

  _onSetSizeToProduct(event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        sizeIndex = event.sizeIndex;
        emit(CartLoaded(
            cart: Cart(products: state.cart.products),
            user: _authBloc.state.user!));
      } catch (error) {}
    }
  }

  double get subTotal {
    final List<Product> products = List<Product>.from(
        _authBloc.state.user!.cart.map((x) => Product.fromMap(x)));
    return products.fold(
        0, (previousValue, product) => previousValue + product.price);
  }

  double deliveryFee() {
    if (subTotal >= 8000.0) {
      return 0.0;
    } else {
      return 1000.0;
    }
  }

  double total() {
    return subTotal + deliveryFee();
  }

  String freeDelivery() {
    if (subTotal >= 8000) {
      return 'You have Free Delivery';
    } else {
      double missing = 8000 - subTotal;
      return 'Add \$${missing.toStringAsFixed(0)} for FREE Delivery';
    }
  }

  Map productQuantity(products) {
    var quantity = {};
    for (Product product in products) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    }
    return quantity;
  }

  @override
  Future<void> close() async {
    _authSubscription?.cancel();
    super.close();
  }
}
