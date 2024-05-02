import 'package:flutter/material.dart';

import '../../../widgets/check_out_card.dart';
import '../../screens.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckoutCard(
      text: 'Check Out',
      press: () {
        Navigator.of(context).pushNamed(CheckoutScreen.routeName);
      },
    );
  }
}
