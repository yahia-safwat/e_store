import 'package:e_store_app1/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/size_config.dart';
import '../../../../core/components/progress_indicator/progress_indicator.dart';
import '../../../../data/models/category_model.dart';
import '../../../../logic/bloc/product/product_bloc.dart';
import '../../../widgets/section_title.dart';
import '../../home/widgets/product_carousel.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SectionTitle(
              title: category.name,
              showSeeMore: true,
              press: () {
                Navigator.of(context).pushNamed(
                  CatalogScreen.routeName,
                  arguments: category,
                );
              }),
        ),
        SizedBox(height: getProportionateScreenWidth(10)),
        BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return buildProgressIndicator();
            }

            if (state is ProductLoaded) {
              final products = state.products
                  .where((product) => product.category == category.name)
                  .toList();
              return Column(
                children: [
                  ProductCarousel(
                    products: products,
                    section: category.name,
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                ],
              );
            } else {
              return Text('Something Went Wrong!');
            }
          },
        ),
      ],
    );
  }
}
