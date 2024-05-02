import 'package:flutter/material.dart';

import 'orders_field.dart';
import 'orders_header.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          OrdersHeader(),
          OrdersField(),
        ],
      ),
    );
  }
}
