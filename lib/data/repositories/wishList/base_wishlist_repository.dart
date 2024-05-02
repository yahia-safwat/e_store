import '../../models/models.dart';

abstract class BaseWishListRepository {
  // Stream<List<WishList>> getAllWishList();
  // Stream<WishList> getUserWishList({required User user});

  Future updateProduct(Product product);
}
