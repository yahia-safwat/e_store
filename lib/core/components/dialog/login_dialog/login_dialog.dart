import 'dart:async';

import 'package:e_store_app1/config/size_config.dart';
import 'package:e_store_app1/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Future<void> showLoginDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () {
          Navigator.of(context).pop(true);
          return Future.value(false);
        },
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(22.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            height: getProportionateScreenHeight(240),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenHeight(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop(true);
                        },
                        child: SvgPicture.asset(
                          'assets/icons/Close.svg',
                          height: getProportionateScreenHeight(24),
                          width: getProportionateScreenWidth(24),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(16),
                ),
                LoginRequired(isDialogOpened: true),
              ],
            ),
          ),
        ),
      );
    },
  );
}

// Future<bool> _onBackPressed(context) {
//   Navigator.of(context).pop(true);
//   return Future.value(true);
// } 

// actions: <Widget>[
//   TextButton(
//     onPressed: () => Navigator.of(context).pop(false),
//     child: Text('No'),
//   ),
//   TextButton(
//     onPressed: () => Navigator.of(context).pop(true),
//     child: Text('Yes'),
//   ),
// ],









// Future<void> _showMyDialog() async {
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('AlertDialog Title'),
//         content: SingleChildScrollView(
//           child: ListBody(
//             children: const <Widget>[
//               Text('This is a demo alert dialog.'),
//               Text('Would you like to approve of this message?'),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('Approve'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );

// }