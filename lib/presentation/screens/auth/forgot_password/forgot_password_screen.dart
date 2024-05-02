import 'package:flutter/material.dart';

import 'widgets/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = "/forgot_password";

  const ForgotPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Body(),
    );
  }
}
