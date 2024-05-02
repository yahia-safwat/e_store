import 'package:e_store_app1/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

class LoginRequired extends StatelessWidget {
  final bool isDialogOpened;
  const LoginRequired({
    Key? key,
    this.isDialogOpened = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            child: Center(
              child: Text(
                'You are not logged in!',
                style: TextStyle(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (isDialogOpened) {
                Navigator.of(context)
                    .pushReplacementNamed(SignInScreen.routeName);
              } else {
                Navigator.of(context).pushNamed(SignInScreen.routeName);
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(),
              primary: Colors.black,
              fixedSize: Size(200, 40),
            ),
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (isDialogOpened) {
                Navigator.of(context)
                    .pushReplacementNamed(SignUpScreen.routeName);
              } else {
                Navigator.of(context).pushNamed(SignUpScreen.routeName);
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(),
              primary: Colors.white,
              fixedSize: Size(200, 50),
            ),
            child: Text(
              'Signup',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
