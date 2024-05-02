import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import 'widgets/app_bar.dart';
import 'widgets/body.dart';
import 'widgets/bottom_nav_bar.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  static const String routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: CustomBody(
        child: Body(),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
