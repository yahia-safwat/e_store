import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/size_config.dart';
import '../../../../core/components/progress_indicator/progress_indicator.dart';
import '../../../../logic/bloc/blocs.dart';
import 'wishlist_product_card.dart';

class WishlistProducts extends StatelessWidget {
  const WishlistProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
      if (state is WishlistLoaded) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(18),
              vertical: getProportionateScreenHeight(10),
            ),
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return buildProgressIndicator();
                }
                if (state is ProductLoaded) {
                  final user = context.read<AuthBloc>().state.user;
                  final products = state.products
                      .where((product) => product.favorites.contains(user!.id))
                      .toList();
                  return ListView.builder(
                    padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(2),
                      horizontal: getProportionateScreenWidth(2),
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      // return Container(child: Text('$index'));
                      return WishlistProductCard(product: products[index]);
                    },
                  );
                } else {
                  return Text('Something Went Wrong!');
                }
              },
            ),
          ),
        );
      } else {
        return Text('Something Went Wrong!');
      }
    });
  }
}
