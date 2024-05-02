import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: Text(
      "Delivery Info",
      style: TextStyle(color: Colors.black),
    ),
    actions: [
      // Padding(
      //   padding: EdgeInsets.only(
      //     left: getProportionateScreenWidth(8),
      //     top: getProportionateScreenHeight(12),
      //     right: getProportionateScreenWidth(12),
      //     bottom: getProportionateScreenHeight(8),
      //   ),
      //   child: AddMoreBtn(),
      // ),
    ],
  );
}
