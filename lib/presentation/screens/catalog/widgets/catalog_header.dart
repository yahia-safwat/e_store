import 'package:e_store_app1/data/models/category_model.dart';
import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class CatalogHeader extends StatelessWidget {
  final Category category;
  const CatalogHeader({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      title: 'Explore',
      subtitle: 'best Outfits for ${category.name}',
    );
  }
}
