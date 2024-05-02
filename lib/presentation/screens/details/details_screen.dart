import 'package:flutter/material.dart';

import '../../../data/models/product_model.dart';
import 'widgets/body.dart';
import 'widgets/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = "/details";

  final Product product;
  final String? tag;

  const DetailsScreen({Key? key, required this.product, this.tag = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(
          rating: 4.5,
          showRating: false,
        ),
      ),
      body: Body(product: product, tag: tag),
    );
  }
}
