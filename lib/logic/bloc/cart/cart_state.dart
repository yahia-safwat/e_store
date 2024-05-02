part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final Cart cart;
  final User? user;
  const CartLoaded({this.user, this.cart = const Cart()});

  @override
  List<Object?> get props => [cart, user];
}

class CartError extends CartState {}
