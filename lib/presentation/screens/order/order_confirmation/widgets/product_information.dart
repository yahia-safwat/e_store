import 'package:e_store_app1/config/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/models.dart';

class ProductInformation extends StatelessWidget {
  const ProductInformation({
    Key? key,
    required this.product,
    required this.fontColor,
    this.isOrderSummary = false,
    this.quantity,
  }) : super(key: key);

  final Product product;
  final Color fontColor;
  final bool isOrderSummary;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 85,
              child: Text(
                product.name,
                maxLines: 1,
                style: TextStyle(
                  color: fontColor,
                  fontSize: getProportionateScreenHeight(13),
                ),
              ),
            ),
            Text(
              'Size: ${product.sizes[0]}',
              style: TextStyle(
                color: fontColor,
                fontSize: getProportionateScreenHeight(13),
              ),
            ),
            Text(
              '\$${product.price}',
              style: TextStyle(
                color: fontColor,
                fontSize: getProportionateScreenHeight(13),
              ),
            ),
          ],
        ),
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: 'Qty.',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenHeight(14),
                ),
              ),
              TextSpan(
                text: ' $quantity',
                style: TextStyle(
                  color: fontColor,
                  fontSize: getProportionateScreenHeight(13),
                ),
              ),
            ],
          ),
        ),
        // Text(
        //   'Qty. $quantity',
        //   style: TextStyle(
        //     color: fontColor,
        //     fontSize: getProportionateScreenHeight(14),
        //   ),
        // ),
      ],
    );
  }
}
