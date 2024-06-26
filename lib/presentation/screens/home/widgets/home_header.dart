import 'package:flutter/material.dart';

import '../../../../config/size_config.dart';
import '../../../widgets/cutsom_appbar_icon_btn.dart';
import '../../../widgets/widgets.dart';
import '../../screens.dart';
import 'drawer_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DrawerField(),
          CutsomAppBarIconBtn(
            svgSrc: "assets/icons/Search Icon.svg",
            press: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
          ),
          CartIconWithCounter(),
        ],
      ),
    );
  }
}
