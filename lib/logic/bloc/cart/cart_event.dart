part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class LoadCart extends CartEvent {
  final User? user;
  const LoadCart({this.user});

  @override
  List<Object?> get props => [user];
}

class AddProductToCart extends CartEvent {
  final Product product;
  const AddProductToCart({required this.product});

  @override
  List<Object?> get props => [product];
}

class ClearCart extends CartEvent {
  const ClearCart();
}

class RemoveProductFromCart extends CartEvent {
  final Product product;
  const RemoveProductFromCart({required this.product});

  @override
  List<Object> get props => [product];
}

class RemoveProductsFromCart extends CartEvent {
  final Product product;
  const RemoveProductsFromCart({required this.product});

  @override
  List<Object> get props => [product];
}

class SetSizeToProduct extends CartEvent {
  final int sizeIndex;
  const SetSizeToProduct({required this.sizeIndex});

  @override
  List<Object> get props => [sizeIndex];
}
