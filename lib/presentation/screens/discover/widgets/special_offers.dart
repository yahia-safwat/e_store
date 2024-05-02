import 'package:e_store_app1/data/models/product_model.dart';
import 'package:e_store_app1/presentation/screens/explore/explore_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/size_config.dart';
import '../../../../core/components/progress_indicator/progress_indicator.dart';
import '../../../../logic/bloc/product/product_bloc.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Padding(
        //   padding:
        //       EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        //   child: SectionTitle(
        //     title: "Special for you",
        //     press: () {},
        //   ),
        // ),
        SizedBox(height: getProportionateScreenWidth(14)),

        BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          if (state is ProductLoading) {
            return buildProgressIndicator();
          }

          if (state is ProductLoaded) {
            final List<Product> products = state.products;
            final List<Product> newProducts =
                products.where((product) => product.isNew == true).toList();

            final List<Product> popularProducts =
                products.where((product) => product.isPopular == true).toList();

            final List<Product> recommendedProducts = products
                .where((product) => product.isRecommended == true)
                .toList();

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SpecialOfferCard(
                    image: "assets/images/Image Banner 2.png",
                    category: "New Arrival",
                    numOfBrands: newProducts.length,
                    press: () {
                      Navigator.of(context).pushNamed(
                        ExploreScreen.routeName,
                        arguments: {
                          'title': 'New Arrival',
                        },
                      );
                    },
                  ),
                  SpecialOfferCard(
                    image: "assets/images/Image Banner 3.png",
                    category: "Popular Now",
                    numOfBrands: popularProducts.length,
                    press: () {
                      Navigator.of(context).pushNamed(
                        ExploreScreen.routeName,
                        arguments: {
                          'title': 'Popular Now',
                        },
                      );
                    },
                  ),
                  SpecialOfferCard(
                    image: "assets/images/Image Banner 3.png",
                    category: "Recommended",
                    numOfBrands: recommendedProducts.length,
                    press: () {
                      Navigator.of(context).pushNamed(
                        ExploreScreen.routeName,
                        arguments: {
                          'title': 'Recommended',
                        },
                      );
                    },
                  ),
                  SizedBox(width: getProportionateScreenWidth(20)),
                ],
              ),
            );
          } else {
            return Text('Something Went Wrong!');
          }
        }),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Products")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
