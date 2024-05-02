import '../../models/models.dart';

abstract class BaseOrderRepository {
  Stream<List<Order>> getAllOrders();
}
