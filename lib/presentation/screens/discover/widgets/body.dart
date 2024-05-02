// ignore_for_file: unused_import

import 'package:e_store_app1/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/progress_indicator/progress_indicator.dart';
import '../../../../logic/bloc/blocs.dart';
import '../../../widgets/widgets.dart';
import 'categories.dart';
import 'category_list.dart';
import 'discount_banner.dart';
import 'discover_header.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DiscoverHeader(),
            // SizedBox(height: getProportionateScreenWidth(10)),
            SpecialOffers(),
            // DiscountBanner(),
            SizedBox(height: getProportionateScreenHeight(16)),
            Categories(),
            CategoryList(),
          ],
        ),
      ),
    );
  }
}
