import 'package:flutter/material.dart';

import '../../../../config/size_config.dart';
import 'add_more_btn.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: Text(
      "Cart",
      style: TextStyle(color: Colors.black),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(8),
          top: getProportionateScreenHeight(12),
          right: getProportionateScreenWidth(12),
          bottom: getProportionateScreenHeight(8),
        ),
        child: AddMoreBtn(),
      ),
    ],
  );
}
