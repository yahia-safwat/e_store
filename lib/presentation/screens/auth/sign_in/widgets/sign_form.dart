// ignore_for_file: unused_import

import 'package:e_store_app1/core/components/snackbar/custom_snackbar.dart';
import 'package:e_store_app1/core/components/snackbar/network_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../../logic/cubit/cubits.dart';
import '../../../../../presentation/widgets/custom_surfix_icon.dart';
import '../../../../../presentation/widgets/form_error.dart';
import '../../../../../core/helpers/keyboard.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../../login_success/login_success_screen.dart';

import '../../../../../presentation/widgets/default_button.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../config/size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          Navigator.of(context)
              .pushReplacementNamed(LoginSuccessScreen.routeName);
        }
        if (state.status == LoginStatus.error) {
          final message = context.read<LoginCubit>().loginErrorMsg;
          showCustomSnackbar(context: context, message: message);
        } else {}
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              buildEmailFormField(),
              SizedBox(height: getProportionateScreenHeight(20)),
              buildPasswordFormField(),
              SizedBox(height: getProportionateScreenHeight(10)),
              Row(
                children: [
                  Checkbox(
                    value: remember,
                    activeColor: kPrimaryColor,
                    onChanged: (value) {
                      setState(() {
                        remember = value;
                      });
                    },
                  ),
                  Text("Remember me"),
                  Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, ForgotPasswordScreen.routeName),
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              FormError(errors: errors),
              SizedBox(height: getProportionateScreenHeight(20)),
              DefaultButton(
                text: "Continue",
                press: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // if all are valid then go to success screen
                    KeyboardUtil.hideKeyboard(context);
                    if (await InternetConnectionChecker().hasConnection) {
                      context.read<LoginCubit>().logInWithCredentials();
                    } else {
                      showNetworkSnackbar(context: context);
                    }
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildPasswordFormField() {
    return BlocBuilder<LoginCubit, LoginState>(
      // buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          onSaved: (newValue) => password = newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kPassNullError);
            } else if (value.length >= 8) {
              removeError(error: kShortPassError);
            }
            context.read<LoginCubit>().passwordChanged(value);

            return;
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kPassNullError);
              return "";
            } else if (value.length < 8) {
              addError(error: kShortPassError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            // If  you are using latest version of flutter then lable text and hint text shown like this
            // if you r using flutter less then 1.20.* then maybe this is not working properly
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
          ),
        );
      },
    );
  }

  Widget buildEmailFormField() {
    return BlocBuilder<LoginCubit, LoginState>(
      // buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          onSaved: (newValue) => email = newValue,
          onChanged: (value) {
            context.read<LoginCubit>().emailChanged(value);
            if (value.isNotEmpty) {
              removeError(error: kEmailNullError);
            } else if (emailValidatorRegExp.hasMatch(value)) {
              removeError(error: kInvalidEmailError);
            }
            return;
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kEmailNullError);
              return "";
            } else if (!emailValidatorRegExp.hasMatch(value)) {
              addError(error: kInvalidEmailError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Email",
            hintText: "Enter your email",
            // If  you are using latest version of flutter then lable text and hint text shown like this
            // if you r using flutter less then 1.20.* then maybe this is not working properly
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
          ),
        );
      },
    );
  }
}
