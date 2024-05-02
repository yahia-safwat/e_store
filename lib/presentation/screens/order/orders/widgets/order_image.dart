import 'package:e_store_app1/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../data/models/models.dart';

class OrderImage extends StatelessWidget {
  const OrderImage({
    Key? key,
    required this.height,
    required this.width,
    required this.order,
  }) : super(key: key);

  final double width;
  final double height;
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenHeight(16)),
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      width: width,
      height: height,
      child: SvgPicture.asset(
        'assets/icons/Cart Icon.svg',
        fit: BoxFit.cover,
      ),
    );
  }
}
