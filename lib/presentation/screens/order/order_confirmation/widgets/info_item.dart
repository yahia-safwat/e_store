import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  final String title;
  final String value;
  final FontWeight? fontWeight;
  const InfoItem({
    Key? key,
    required this.title,
    required this.value,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            '$title:',
            style: TextStyle(),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: TextStyle(
              fontWeight: fontWeight,
            ),
          ),
        ),
      ],
    );
  }
}
