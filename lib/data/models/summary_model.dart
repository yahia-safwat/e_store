import 'package:equatable/equatable.dart';

class Summary extends Equatable {
  final double total;
  final double deliveryFee;
  final double subTotal;
  const Summary({
    required this.total,
    required this.deliveryFee,
    required this.subTotal,
  });

  @override
  List<Object?> get props => [total, deliveryFee, subTotal];
}
