import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/product_model.dart';
import 'base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;
  ProductRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs
          .map((docSnapshot) => Product.fromSnapshot(docSnapshot))
          .toList();
    });
  }

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
