import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';
import 'base_order_repository.dart';

class OrderRepository extends BaseOrderRepository {
  final FirebaseFirestore _firebaseFirestore;
  OrderRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Stream<List<Order>> getAllOrders() {
    return _firebaseFirestore
        .collection('orders')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs
          .map((docSnapshot) => Order.fromSnapshot(docSnapshot))
          .toList();
    });
  }
}
