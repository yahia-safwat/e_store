import 'package:e_store_app1/config/size_config.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../data/models/models.dart';
import 'info_item.dart';

class OrderInfo extends StatelessWidget {
  final Order order;
  const OrderInfo({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              InfoItem(
                title: 'Date',
                value: DateFormat('dd-MMM-yy').format(order.createdAt!),
              ),
              // SizedBox(height: 5),
              InfoItem(
                title: 'Customer',
                value: '${order.customerName}',
              ),
              // SizedBox(height: 5),
              InfoItem(
                title: 'Phone',
                value: '${order.customerPhone}',
              ),
              // SizedBox(height: 5),
              InfoItem(
                title: 'City',
                value: '${order.customerCity}',
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              InfoItem(
                title: 'Subtotal',
                value: '\$${order.subtotal}',
              ),
              // SizedBox(height: 5),
              InfoItem(
                title: 'Delivery Fee',
                value: '\$${order.deliveryFee}',
              ),
              // SizedBox(height: 5),
              InfoItem(
                title: 'Total',
                value: '\$${order.total}',
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
