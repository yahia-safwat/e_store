import 'package:e_store_app1/data/models/product_model.dart';
import 'package:e_store_app1/presentation/widgets/rounded_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../config/size_config.dart';
import '../../../../logic/bloc/blocs.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(product.images[0]),
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: getProportionateScreenWidth(110),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenHeight(13),
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Size: ${product.sizes[0]}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenHeight(13),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '\$${product.price}',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: getProportionateScreenHeight(14),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              QuantityField(
                product: product,
                quantity: quantity,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class QuantityField extends StatelessWidget {
  final int quantity;
  final Product product;

  const QuantityField({
    Key? key,
    required this.quantity,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              width: getProportionateScreenWidth(10.0),
              height: getProportionateScreenHeight(30.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RoundedIconBtn(
                      icon: Icons.remove_circle,
                      press: () {
                        context
                            .read<CartBloc>()
                            .add(RemoveProductFromCart(product: product));
                      }),
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      child: Center(
                        child: Text(
                          quantity.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getProportionateScreenHeight(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  RoundedIconBtn(
                      icon: Icons.add_circle,
                      press: () {
                        context
                            .read<CartBloc>()
                            .add(AddProductToCart(product: product));
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
