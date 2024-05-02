part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object?> get props => [];
}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final User? user;
  final Product? product;
  final String? action;

  const WishlistLoaded({this.user, this.product, this.action});

  @override
  List<Object?> get props => [user?.id, product?.uid, action];
}

// class WishlistError extends WishlistState {}
