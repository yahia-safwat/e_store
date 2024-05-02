import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/models.dart';
import 'base_wishlist_repository.dart';

class WishlistRepository extends BaseWishListRepository {
  final FirebaseFirestore _firebaseFirestore;
  WishlistRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  // @override
  // Stream<List<WishList>> getAllWishList() {
  //   return _firebaseFirestore
  //       .collection('favorites')
  //       .snapshots()
  //       .map((querySnapshot) {
  //     return querySnapshot.docs
  //         .map((docSnapshot) => WishList.fromSnapshot(docSnapshot))
  //         .toList();
  //   });
  // }

  // @override
  // Stream<WishList> getUserWishList({required User user}) {
  //   return _firebaseFirestore
  //       .collection('favorites')
  //       .doc(user.email)
  //       .snapshots()
  //       .map((querySnapshot) {
  //     try {
  //       return WishList.fromSnapshot(querySnapshot);
  //     } catch (e) {
  //       return WishList(products: <Product>[]);
  //     }
  //   });
  // }

  // @override
  // Future<void> updateWishList(
  //     {required WishList wishList, required User user}) {
  //   return _firebaseFirestore
  //       .collection('favorites')
  //       .doc(user.email)
  //       .set(wishList.toDocument());
  // }

  @override
  Future updateProduct(Product product) async {
    try {
      await _firebaseFirestore
          .collection('products')
          .doc(product.uid)
          .update(product.toMap());
      return true;
    } catch (error) {
      return false;
    }
  }
}
