import 'package:e_store_app1/core/enums/enums.dart';
import 'package:e_store_app1/presentation/widgets/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/body.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = '/search';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
