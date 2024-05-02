import 'package:e_store_app1/config/size_config.dart';
import 'package:e_store_app1/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../logic/bloc/cart/cart_bloc.dart';

class ProductSizes extends StatefulWidget {
  final Product product;
  const ProductSizes({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductSizes> createState() => _ProductSizesState();
}

class _ProductSizesState extends State<ProductSizes> {
  int activeSize = 0;

  @override
  void initState() {
    context.read<CartBloc>().add(SetSizeToProduct(sizeIndex: 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Size Guide:',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Color(0XFF8B8B8B),
                    fontSize: 18,
                  ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
            padding: EdgeInsets.only(left: 4, right: 4),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(widget.product.sizes.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        activeSize = index;
                        context
                            .read<CartBloc>()
                            .add(SetSizeToProduct(sizeIndex: activeSize));
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 5, bottom: 5, left: 5, top: 5),
                      child: Container(
                        width: getProportionateScreenWidth(40),
                        height: getProportionateScreenHeight(40),
                        decoration: BoxDecoration(
                            color: activeSize == index
                                ? kPrimaryColor
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 0.5,
                                offset: Offset(0.0, 4.0),
                                blurRadius: 10,
                                color: activeSize == index
                                    ? Colors.black.withOpacity(.5)
                                    : Colors.black12,
                              )
                            ]),
                        child: Center(
                          child: Text(
                            widget.product.sizes[index],
                            style: TextStyle(
                                fontSize: getProportionateScreenHeight(14),
                                color: activeSize == index
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            )),
      ],
    );
  }
}
