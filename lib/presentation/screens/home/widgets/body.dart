// ignore_for_file: unused_import

import 'package:e_store_app1/data/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../config/size_config.dart';
import 'custom_carousel.dart';
import 'explore_list.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            // DiscountBanner(),
            // Categories(),
            // SpecialOffers(),
            CustomCarousel(),
            SizedBox(height: getProportionateScreenWidth(20)),
            ExploreList(),
          ],
        ),
      ),
    );
  }
}
