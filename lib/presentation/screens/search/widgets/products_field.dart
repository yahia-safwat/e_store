import 'package:e_store_app1/data/models/product_model.dart';
import 'package:flutter/material.dart';

import 'search_card.dart';

class ProductsField extends StatelessWidget {
  final List<Product> products;
  const ProductsField({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return SearchCard(product: products[index]);
      },
    );
  }
}
