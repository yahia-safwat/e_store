import 'package:e_store_app1/data/models/order_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/components.dart';
import 'widgets/body.dart';

class OrderConfirmationScreen extends StatelessWidget {
  static const String routeName = '/order-confirmation';

  final Order order;
  const OrderConfirmationScreen({Key? key, required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Scaffold(
        // appBar: CustomAppBar(title: 'Order Confirmation'),
        // bottomNavigationBar: CustomNavBar(screen: routeName),
        extendBodyBehindAppBar: true,
        body: Body(order: order),
      ),
    );
  }
}
