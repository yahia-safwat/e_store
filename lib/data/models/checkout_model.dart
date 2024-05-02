import 'package:equatable/equatable.dart';
import 'models.dart';

class Checkout extends Equatable {
  final User? user;
  final String? orderId;
  final String? orderCode;
  final String? customerName;
  final String? customerPhone;
  final String? customerAddress;
  final String? customerCity;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final String? discount;
  final bool? isAccepted;
  final bool? isCancelled;
  final bool? isDelivered;
  final DateTime? createdAt;

  const Checkout({
    required this.orderId,
    required this.orderCode,
    this.user = User.empty,
    required this.customerName,
    required this.customerPhone,
    required this.customerAddress,
    required this.customerCity,
    required this.products,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    required this.discount,
    this.isAccepted = false,
    this.isCancelled = false,
    this.isDelivered = false,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        orderId,
        orderCode,
        user,
        customerName,
        customerPhone,
        customerAddress,
        customerCity,
        products,
        subtotal,
        deliveryFee,
        total,
        discount,
        isAccepted,
        isCancelled,
        isDelivered,
        createdAt,
      ];

  Map<String, Object> toDocument() {
    final orderProducts = productQuantity(products!);
    return {
      'orderId': orderId!,
      'orderCode': orderCode!,
      'userId': user!.id ?? '',
      'customerName': customerName!,
      'customerPhone': customerPhone!,
      'customerAddress': customerAddress!,
      'customerCity': customerCity!,
      'products': orderProducts.entries
          .map((product) => {
                'id': (product.key as Product).id.toString(),
                'name': (product.key as Product).name.toString(),
                'price': (product.key as Product).price.toString(),
                'size': (product.key as Product).sizes[0].toString(),
                'color': 'unknown',
                'quantity': product.value.toString(),
              })
          .toList(),
      'subtotal': subtotal!,
      'deliveryFee': deliveryFee!,
      'total': total!,
      'discount': discount!,
      'isAccepted': isAccepted!,
      'isCancelled': isCancelled!,
      'isDelivered': isDelivered!,
      'createdAt': createdAt!
    };
  }
}

Map productQuantity(products) {
  var quantity = {};
  for (Product product in products) {
    if (!quantity.containsKey(product)) {
      quantity[product] = 1;
    } else {
      quantity[product] += 1;
    }
  }
  return quantity;
}
