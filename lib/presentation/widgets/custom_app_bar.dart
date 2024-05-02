import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: InkWell(
        onTap: (() => Navigator.of(context).pop()),
        child: Text(
          'back',
          style: TextStyle(color: Colors.black),
        ),
      ),
      // actions: [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
