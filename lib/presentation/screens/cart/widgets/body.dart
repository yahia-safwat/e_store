import 'package:e_store_app1/config/size_config.dart';
import 'package:e_store_app1/data/models/cart_model.dart';
import 'package:e_store_app1/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/components/progress_indicator/progress_indicator.dart';
import '../../../../logic/bloc/blocs.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CartLoading) {
          return buildProgressIndicator();
        } else if (state is CartLoaded) {
          final List<Product> products = List<Product>.from(
              state.user!.cart.map((x) => Product.fromMap(x)));

          final Cart cart = Cart(products: products);
          final CartBloc _cartBloc = context.read<CartBloc>();
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              context.read<CartBloc>().freeDelivery(),
                              style: TextStyle(
                                fontSize: getProportionateScreenHeight(12),
                              ),
                            ),
                            // AddMoreBtn(),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: SizedBox(
                          child: BlocBuilder<CartBloc, CartState>(
                            builder: (context, state) {
                              if (state is CartLoaded) {
                                return ListView.builder(
                                  itemCount: _cartBloc
                                      .productQuantity(cart.products)
                                      .keys
                                      .length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 4),
                                      child: Dismissible(
                                        key: Key(_cartBloc
                                            .productQuantity(cart.products)
                                            .keys
                                            .elementAt(index)
                                            .sizes
                                            .toString()),
                                        direction: DismissDirection.endToStart,
                                        onDismissed: (direction) {
                                          // final user = context
                                          //     .read<AuthBloc>()
                                          //     .state
                                          //     .user;
                                          setState(() {
                                            context.read<CartBloc>().add(
                                                  RemoveProductsFromCart(
                                                    product: _cartBloc
                                                        .productQuantity(
                                                            cart.products)
                                                        .keys
                                                        .elementAt(index),
                                                  ),
                                                );
                                          });
                                        },
                                        background: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFFE6E6),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Row(
                                            children: [
                                              Spacer(),
                                              SvgPicture.asset(
                                                  "assets/icons/Trash.svg"),
                                            ],
                                          ),
                                        ),
                                        child: CartCard(
                                          product: _cartBloc
                                              .productQuantity(cart.products)
                                              .keys
                                              .elementAt(index),
                                          quantity: _cartBloc
                                              .productQuantity(cart.products)
                                              .values
                                              .elementAt(index),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return Center(
                                    child: Text('Something Went Wrong'));
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return Text('Something Went Wrong!');
        }
      },
    );
  }
}
