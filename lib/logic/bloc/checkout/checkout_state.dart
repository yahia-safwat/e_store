part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final String? orderId;
  final String? orderCode;
  final User? user;
  final String? customerName;
  final String? customerPhone;
  final String? customerAddress;
  final String? customerCity;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final String? discount;
  final Checkout checkout;
  final DateTime? createdAt;

  CheckoutLoaded({
    this.orderId,
    this.orderCode,
    this.user = User.empty,
    this.customerName,
    this.customerPhone,
    this.customerAddress,
    this.customerCity,
    this.products,
    this.subtotal,
    this.deliveryFee,
    this.total,
    this.discount,
    this.createdAt,
  }) : checkout = Checkout(
          orderId: orderId,
          orderCode: orderCode,
          user: user,
          customerName: customerName,
          customerPhone: customerPhone,
          customerAddress: customerAddress,
          customerCity: customerCity,
          products: products,
          subtotal: subtotal,
          deliveryFee: deliveryFee,
          total: total,
          discount: discount,
          createdAt: createdAt,
        );

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
        checkout,
        createdAt
      ];
}
