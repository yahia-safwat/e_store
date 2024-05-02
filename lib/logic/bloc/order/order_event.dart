part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class LoadOrders extends OrderEvent {}

class UpdateOrders extends OrderEvent {
  final List<Order> orders;
  const UpdateOrders({required this.orders});

  @override
  List<Object> get props => [orders];
}
