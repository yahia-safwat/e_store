import 'package:flutter/material.dart';

import '../../../../../data/models/models.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.height,
    required this.width,
    required this.product,
  }) : super(key: key);

  final double width;
  final double height;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Image.network(
        product.images[0],
        fit: BoxFit.cover,
      ),
    );
  }
}
