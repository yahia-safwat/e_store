import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../config/size_config.dart';

class ConfirmationHeader extends StatelessWidget {
  const ConfirmationHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black,
          width: double.infinity,
          height: getProportionateScreenHeight(280),
        ),
        Positioned(
          left: (MediaQuery.of(context).size.width - 100) / 2,
          top: getProportionateScreenHeight(100),
          child: SvgPicture.asset(
            'assets/icons/Garlands.svg',
            height: 80,
            width: 80,
          ),
        ),
        Positioned(
          top: getProportionateScreenHeight(210),
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Text(
            'Order Placed Successfully!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: getProportionateScreenHeight(16),
            ),
          ),
        ),
      ],
    );
  }
}
