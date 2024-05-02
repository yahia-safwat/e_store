import 'package:e_store_app1/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

import '../../../../../config/size_config.dart';
import '../../../../../data/models/models.dart';
import 'product_information.dart';
import 'search_image.dart';

class SearchCard extends StatelessWidget {
  final Product product;
  const SearchCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
      child: Container(
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(6),
          top: getProportionateScreenHeight(6),
          right: getProportionateScreenWidth(12),
          bottom: getProportionateScreenHeight(6),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 2.0,
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              DetailsScreen.routeName,
              arguments: {
                'product': product,
              },
            );
          },
          child: Row(
            children: [
              SearchImage(
                width: getProportionateScreenWidth(80),
                height: getProportionateScreenHeight(70),
                product: product,
              ),
              SizedBox(width: getProportionateScreenWidth(10)),
              Expanded(
                child: ProductInformation(
                  product: product,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
