import 'package:flutter/material.dart';

import 'widgets/body.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Body(),
    );
  }
}

