import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/constants.dart';

import '../../../../config/size_config.dart';
import 'rating_bar.dart';

class CustomAppBar extends StatelessWidget {
  final double rating;
  final bool showRating;

  const CustomAppBar({
    Key? key,
    required this.rating,
    required this.showRating,
  }) : super(key: key);

  // @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(16)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16)),
            child: Row(
              children: [
                SizedBox(
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(90),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      primary: kPrimaryColor,
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/Back ICon.svg",
                          height: 15,
                        ),
                        Text(
                          'back',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                if (showRating == true) RatingBar(rating: rating),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
