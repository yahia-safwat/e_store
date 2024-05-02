import 'package:flutter/material.dart';

void showCustomSnackbar({
  required BuildContext context,
  required String message,
  int? seconds,
}) {
  final snackBar = SnackBar(
    content: Text(message),
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
