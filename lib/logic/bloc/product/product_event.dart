part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class LoadProducts extends ProductEvent {}

class UpdateProducts extends ProductEvent {
  final List<Product>? products;

  const UpdateProducts({required this.products});

  @override
  List<Object?> get props => [products];
}

// class AddProductToWishList extends ProductEvent {
//   final Product product;
//   const AddProductToWishList({required this.product});

//   @override
//   List<Object> get props => [product];
// }

// class RemoveProductFromWishList extends ProductEvent {
//   final Product product;

//   const RemoveProductFromWishList({required this.product});

//   @override
//   List<Object> get props => [product];
// }
