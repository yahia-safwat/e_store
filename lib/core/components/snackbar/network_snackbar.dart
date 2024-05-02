import 'package:flutter/material.dart';

void showNetworkSnackbar({
  required BuildContext context,
  String? message,
  int? seconds,
}) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(
      message ?? 'No Internet Connection!',
    ),
    duration: Duration(seconds: seconds ?? 1),
    // margin: const EdgeInsets.only(bottom: 16, right: 8, left: 8),
    // padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
    // shape: const RoundedRectangleBorder(
    //   borderRadius: BorderRadius.all(Radius.circular(12)),
    // ),
    // behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
