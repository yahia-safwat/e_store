import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/size_config.dart';
import '../../../../core/components/progress_indicator/progress_indicator.dart';
import '../../../../data/models/models.dart';
import '../../../../logic/bloc/blocs.dart';
import 'catalog_product_cart.dart';

class ProductListField extends StatelessWidget {
  const ProductListField({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(18),
          vertical: getProportionateScreenHeight(10),
        ),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoaded) {
              final List<Product> categoryProducts = state.products
                  .where((product) => product.category == category.name)
                  .toList();
              return ListView.builder(
                padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(2),
                  horizontal: getProportionateScreenWidth(2),
                ),
                itemCount: categoryProducts.length,
                itemBuilder: (context, index) {
                  final product = categoryProducts[index];
                  return CatalogProductCard(product: product);
                },
              );
            }
            if (state is ProductLoading) {
              return buildProgressIndicator();
            } else {
              return Text('Something Went Wrong!');
            }
          },
        ),
      ),
    );
  }
}
