import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/category_model.dart';
import 'base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;
  CategoryRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Stream<List<Category>> getAllCategories() {
    return _firebaseFirestore
        .collection('categories')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs
          .map((docSnapshot) => Category.fromSnapshot(docSnapshot))
          .toList();
    });
  }
}
