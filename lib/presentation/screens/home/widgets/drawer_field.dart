import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/size_config.dart';

class DrawerField extends StatelessWidget {
  const DrawerField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.topLeft,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(2)),
                height: getProportionateScreenWidth(40),
                width: getProportionateScreenWidth(40),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset('assets/icons/Menu.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
