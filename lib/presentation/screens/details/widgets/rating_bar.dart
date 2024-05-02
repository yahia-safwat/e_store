import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/size_config.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({
    Key? key,
    required this.rating,
  }) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(70),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Text(
            "$rating",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 5),
          SvgPicture.asset("assets/icons/Star Icon.svg"),
        ],
      ),
    );
  }
}
