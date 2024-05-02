import 'package:flutter/material.dart';

import '../../../../config/size_config.dart';
import 'search_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          SearchField(),
          SizedBox(height: getProportionateScreenHeight(10)),
        ],
      ),
    ));
  }
}


  // Container(
  //       width: SizeConfig.screenWidth * 0.6,
  //       decoration: BoxDecoration(
  //         color: kSecondaryColor.withOpacity(0.1),
  //         borderRadius: BorderRadius.circular(15),
  //       ),
  //       child: TextField(
  //         onChanged: (value) => print(value),
  //         decoration: InputDecoration(
  //             contentPadding: EdgeInsets.symmetric(
  //                 horizontal: getProportionateScreenWidth(20),
  //                 vertical: getProportionateScreenWidth(9)),
  //             border: InputBorder.none,
  //             focusedBorder: InputBorder.none,
  //             enabledBorder: InputBorder.none,
  //             hintText: "Search product",
  //             prefixIcon: Icon(Icons.search)),
  //       ),
  //     ),),