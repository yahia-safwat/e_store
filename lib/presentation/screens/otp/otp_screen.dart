import 'package:flutter/material.dart';

import 'widgets/body.dart';

class OtpScreen extends StatelessWidget {
  static const String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: Body(),
    );
  }
}
