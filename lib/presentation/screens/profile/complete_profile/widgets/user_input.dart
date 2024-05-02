import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../logic/cubit/cubits.dart';

class UserInput extends StatelessWidget {
  const UserInput({
    Key? key,
    required this.onChanged,
    required this.labelText,
    required this.hintText,
    required this.onSaved,
    required this.validator,
    required this.suffixIcon,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final Function(String)? onChanged;
  final Function(String?)? onSaved;

  final String labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return TextFormField(
          onSaved: (newValue) => onSaved,
          onChanged: onChanged,
          validator: validator,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: suffixIcon,
          ),
        );
      },
    );
  }
}
