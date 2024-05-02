import 'package:flutter/material.dart';

import 'explore_header.dart';
import 'product_list_field.dart';

class Body extends StatelessWidget {
  final String title;
  const Body({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ExploreHeader(title: title),
          ProductListField(title: title),
        ],
      ),
    );
  }
}
