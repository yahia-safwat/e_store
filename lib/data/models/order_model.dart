import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String? userId;
  final String? orderCode;
  final String? customerName;
  final String? customerPhone;
  final String? customerAddress;
  final String? customerCity;
  final String total;
  final String subtotal;
  final String deliveryFee;
  final List products;
  final bool? isAccepted;
  final bool? isCancelled;
  final bool? isDelivered;
  final DateTime? createdAt;

  const Order({
    this.userId,
    required this.orderCode,
    required this.customerName,
    required this.customerPhone,
    this.customerAddress,
    required this.customerCity,
    required this.total,
    required this.subtotal,
    required this.deliveryFee,
    required this.products,
    this.isAccepted,
    this.isCancelled,
    this.isDelivered,
    required this.createdAt,
  });

  static Order fromSnapshot(DocumentSnapshot snapshot) {
    Order order = Order(
      userId: snapshot['userId'],
      orderCode: snapshot['orderCode'],
      customerName: snapshot['customerName'],
      customerPhone: snapshot['customerPhone'],
      customerCity: snapshot['customerCity'],
      total: snapshot['total'],
      subtotal: snapshot['subtotal'],
      deliveryFee: snapshot['deliveryFee'],
      products: snapshot['products'],
      isAccepted: snapshot['isAccepted'],
      isCancelled: snapshot['isCancelled'],
      isDelivered: snapshot['isDelivered'],
      createdAt: snapshot['createdAt'].toDate(),
    );
    return order;
  }

  @override
  List<Object?> get props => [
        userId,
        orderCode,
        customerName,
        customerPhone,
        customerAddress,
        customerCity,
        total,
        subtotal,
        deliveryFee,
        products,
        isAccepted,
        isCancelled,
        isDelivered,
        createdAt,
      ];
}
