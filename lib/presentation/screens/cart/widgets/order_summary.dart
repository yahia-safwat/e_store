import 'package:e_store_app1/config/size_config.dart';
import 'package:e_store_app1/logic/bloc/cart/cart_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          final CartBloc _cartBloc = context.read<CartBloc>();
          return Column(
            children: [
              Divider(thickness: 2),
              Padding(
                padding: EdgeInsets.only(
                  top: getProportionateScreenHeight(4.0),
                  bottom: getProportionateScreenHeight(4.0),
                ),
                child: Column(
                  children: [
                    AmountItem(
                      title: 'Subtotal',
                      amount: '\$${_cartBloc.subTotal.toStringAsFixed(0)}',
                    ),
                    // SizedBox(height: 5),
                    AmountItem(
                      title: 'Delivery Fee',
                      amount: '\$${_cartBloc.deliveryFee().toStringAsFixed(0)}',
                    ),
                    // SizedBox(height: 5),
                    AmountItem(
                      title: 'Total',
                      amount: '\$${_cartBloc.total().toStringAsFixed(0)}',
                      fontWeight: _cartBloc.total() >= 1000000
                          ? FontWeight.normal
                          : FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Text('Something went Wrong!');
        }
      },
    );
  }
}

class AmountItem extends StatelessWidget {
  final String title;
  final String amount;
  final FontWeight? fontWeight;
  const AmountItem({
    Key? key,
    required this.title,
    required this.amount,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 6,
          child: Text(
            title,
            style: TextStyle(),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            amount,
            style: TextStyle(
              fontWeight: fontWeight,
            ),
          ),
        ),
      ],
    );
  }
}
