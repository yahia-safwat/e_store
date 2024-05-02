import 'package:e_store_app1/presentation/screens/explore/explore_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/size_config.dart';
import '../../../../core/components/progress_indicator/progress_indicator.dart';
import '../../../../data/models/product_model.dart';
import '../../../../logic/bloc/product/product_bloc.dart';
import '../../../widgets/section_title.dart';
import '../../home/widgets/product_carousel.dart';

class ExploreItem extends StatelessWidget {
  final String title;
  const ExploreItem({
    Key? key,
    required this.title,
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
              title: title,
              press: () {
                Navigator.of(context).pushNamed(
                  ExploreScreen.routeName,
                  arguments: {
                    'title': title,
                  },
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
              final products = getProducts(state.products, title);
              return Column(
                children: [
                  ProductCarousel(
                    products: products,
                    section: title,
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

List<Product> getProducts(List<Product> products, String title) {
  switch (title) {
    case 'New Arrival':
      return products.where((product) => product.isNew == true).toList();

    case 'Popular Now':
      return products.where((product) => product.isPopular == true).toList();

    case 'Recommended':
      return products
          .where((product) => product.isRecommended == true)
          .toList();

    default:
      return products;
  }
}
