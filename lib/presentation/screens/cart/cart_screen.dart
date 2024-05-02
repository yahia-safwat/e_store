import 'package:flutter/material.dart';

import 'widgets/app_bar.dart';
import 'widgets/body.dart';
import 'widgets/bottom_nav_bar.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = "/cart";

  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
