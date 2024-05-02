import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image(
            image: AssetImage('assets/images/shoes2.png'),
            width: 125,
            height: 125,
          ),
        ),
        SizedBox(height: 30),
        Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Text('Zero To Unicorn', style: TextStyle(color: Colors.white)),
        )
      ],
    );
  }
}
