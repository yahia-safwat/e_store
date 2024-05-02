import 'package:e_store_app1/config/size_config.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String? hintText;
  final String? initialValue;

  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    Key? key,
    required this.title,
    this.hintText,
    required this.onChanged,
    required this.validator,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(8.0),
          vertical: getProportionateScreenHeight(1.0)),
      child: Row(
        children: [
          SizedBox(
            width: getProportionateScreenWidth(76),
            child: Text(title, style: TextStyle()),
          ),
          SizedBox(width: getProportionateScreenWidth(10)),
          Expanded(
              child: TextFormField(
            initialValue: initialValue,
            onChanged: onChanged,
            validator: validator,
            decoration: InputDecoration(
              errorStyle: TextStyle(height: 0),
              contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(8),
                vertical: getProportionateScreenHeight(8),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 1.2, color: Colors.black),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 0.0),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 0.0),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(width: 0.0),
              ),
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 12),
            ),
          )),
        ],
      ),
    );
  }
}
