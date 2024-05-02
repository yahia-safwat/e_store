import 'package:e_store_app1/config/size_config.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final double? height;
  const SmallText(
      {Key? key,
      required this.text,
      this.color = const Color(0xFFccc7c5),
      this.fontSize,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize:
            fontSize == null ? getProportionateScreenHeight(12) : fontSize!,
        fontFamily: 'Roboto',
        height: height,
      ),
    );
  }
}
