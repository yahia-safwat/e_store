part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object?> get props => [];
}

class LoadWishList extends WishlistEvent {}

class UpdateWishList extends WishlistEvent {
  final User? user;
  final List<Product>? favorites;

  const UpdateWishList({this.user, this.favorites});

  @override
  List<Object?> get props => [user!, favorites];
}

class AddProductToWishList extends WishlistEvent {
  final User? user;
  final Product product;
  const AddProductToWishList({required this.user, required this.product});

  @override
  List<Object?> get props => [user, product];
}

class RemoveProductFromWishList extends WishlistEvent {
  final User? user;
  final Product product;
  const RemoveProductFromWishList({required this.user, required this.product});

  @override
  List<Object?> get props => [user, product];
}
