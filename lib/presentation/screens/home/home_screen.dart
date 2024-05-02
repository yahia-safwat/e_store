import 'package:e_store_app1/config/size_config.dart';
import 'package:flutter/material.dart';
import '../../../core/components/components.dart';
import '../../../presentation/widgets/coustom_bottom_nav_bar.dart';
import '../../../core/enums/enums.dart';

import 'widgets/body.dart';
import 'widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/";

  // final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Scaffold(
        drawer: CustomDrawer(),
        body: Body(),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      ),
    );
  }
}
