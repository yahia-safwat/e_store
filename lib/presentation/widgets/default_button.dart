import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/size_config.dart';
import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import '../../logic/bloc/blocs.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: getProportionateScreenHeight(44),
          child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              primary: Colors.white,
              backgroundColor: kPrimaryColor,
            ),
            onPressed: press as void Function()?,
            child: Text(
              text!,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
