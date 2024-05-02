import 'package:flutter/material.dart';

import '../../../../data/models/models.dart';
import 'catalog_header.dart';
import 'product_list_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CatalogHeader(category: category),
          ProductListField(category: category),
        ],
      ),
    );
  }
}
