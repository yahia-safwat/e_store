import 'package:flutter/material.dart';

import '../../../../core/components/components.dart';
import '../../../../core/enums/enums.dart';
import '../../../../presentation/widgets/coustom_bottom_nav_bar.dart';
import '../../../widgets/widgets.dart';
import 'widgets/body.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = "/orders";

  const OrdersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Scaffold(
        // appBar: AppBar(),
        body: CustomBody(
          child: Body(),
        ),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.orders),
      ),
    );
  }
}
