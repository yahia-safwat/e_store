import 'package:flutter/material.dart';

Future<bool> onWillPop(context) async {
  bool? exitApp = await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Are you sure?'),
      content: Text('Do you want to exit an App'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Yes'),
        ),
      ],
    ),
  );

  return exitApp ?? false;
}
