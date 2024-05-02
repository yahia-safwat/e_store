import 'package:e_store_app1/core/enums/enums.dart';
import 'package:e_store_app1/presentation/widgets/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../../data/models/category_model.dart';
import 'widgets/body.dart';

class CatalogScreen extends StatelessWidget {
  final Category category;
  const CatalogScreen({Key? key, required this.category}) : super(key: key);

  static const String routeName = '/catalog';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(context, category),
      body: Body(category: category),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.catalog),
    );
  }
}

// AppBar buildAppBar(BuildContext context, Category category) {
//   return AppBar(
//     title: InkWell(
//       onTap: (() => Navigator.of(context).pop()),
//       child: Text(
//         'back',
//         style: TextStyle(color: Colors.black),
//       ),
//     ),
//     // actions: [],
//   );
// }
