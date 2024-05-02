import 'package:flutter/material.dart';

import '../../config/size_config.dart';
import '../screens/search/search_screen.dart';
import 'cutsom_appbar_icon_btn.dart';
import 'widgets.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showSearchIcon;
  const CustomHeader({
    required this.title,
    required this.subtitle,
    this.showSearchIcon = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        getProportionateScreenWidth(18),
        getProportionateScreenHeight(12),
        getProportionateScreenWidth(20),
        getProportionateScreenHeight(0),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(22),
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(16),
                  ),
                ),
              ],
            ),
          ),
          showSearchIcon
              ? CutsomAppBarIconBtn(
                  svgSrc: "assets/icons/Search Icon.svg",
                  press: () {
                    Navigator.pushNamed(context, SearchScreen.routeName);
                  },
                )
              : SizedBox(),
          CartIconWithCounter(),
        ],
      ),
    );
  }
}
