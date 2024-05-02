import 'package:e_store_app1/config/size_config.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final TextOverflow? overflow;
  const BigText({
    Key? key,
    required this.text,
    this.color = const Color(0xFF332d2b),
    this.fontSize,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize:
            fontSize == null ? getProportionateScreenHeight(16) : fontSize!,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      ),
    );
  }
}
