import 'package:e_store_app1/config/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/models.dart';
import 'product_image.dart';
import 'product_information.dart';

class SummaryCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const SummaryCard({Key? key, required this.product, required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          ProductImage(
            width: getProportionateScreenWidth(80),
            height: getProportionateScreenHeight(70),
            product: product,
          ),
          SizedBox(width: getProportionateScreenWidth(10)),
          Expanded(
            child: ProductInformation(
              product: product,
              fontColor: Colors.black,
              quantity: quantity,
            ),
          ),
        ],
      ),
    );
  }
}
