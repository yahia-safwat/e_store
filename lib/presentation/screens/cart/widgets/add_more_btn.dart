import 'package:flutter/material.dart';

import '../../../../config/size_config.dart';
import '../../screens.dart';

class AddMoreBtn extends StatelessWidget {
  const AddMoreBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.black,
          fixedSize: Size(
            getProportionateScreenWidth(140),
            getProportionateScreenHeight(12),
          )),
      onPressed: () {
        Navigator.of(context).pushNamed(HomeScreen.routeName);
      },
      child: Text(
        'Add More Items',
        style: TextStyle(fontSize: getProportionateScreenHeight(12)),
      ),
    );
  }
}
