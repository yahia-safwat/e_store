import 'package:e_store_app1/config/size_config.dart';
import 'package:e_store_app1/presentation/screens/order/order_confirmation/widgets/summary_product_card.dart';
import 'package:e_store_app1/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/progress_indicator/progress_indicator.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../data/models/models.dart';
import '../../../../../logic/bloc/blocs.dart';
import 'confirmation_header.dart';
import 'order_info.dart';

class Body extends StatelessWidget {
  final Order order;
  const Body({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return buildProgressIndicator();
          }
          if (state is CheckoutLoaded) {
            Map products = productQuantity(order.products);
            return SingleChildScrollView(
              child: Column(
                children: [
                  ConfirmationHeader(),
                  Padding(
                    padding: EdgeInsets.all(getProportionateScreenHeight(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   'Hi, Yahia',
                        //   style: TextStyle(
                        //     fontSize: getProportionateScreenHeight(20),
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        // SizedBox(height: getProportionateScreenHeight(10)),
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Thank you',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenHeight(16),
                                    color: Colors.black,
                                  )),
                              TextSpan(
                                  text:
                                      ' for your order!.. We will call you when the order is ready.',
                                  style: TextStyle(
                                    fontSize: getProportionateScreenHeight(14),
                                  )),
                            ],
                          ),
                        ),
                        // Text(
                        //     'Thank you for your order!.. We will call you when the order is ready.',
                        //     style: TextStyle(
                        //       fontSize: getProportionateScreenHeight(14),
                        //     )),
                        SizedBox(height: getProportionateScreenHeight(20)),
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'ORDER CODE:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenHeight(20),
                                    color: Colors.black,
                                  )),
                              TextSpan(
                                  text: ' #${order.orderCode}',
                                  style: TextStyle(
                                    fontSize: getProportionateScreenHeight(15),
                                  )),
                            ],
                          ),
                        ),
                        // Text(
                        //   'ORDER CODE: #k321-ekd3',
                        //   style: Theme.of(context).textTheme.headline5,
                        // ),

                        OrderInfo(order: order),
                        SizedBox(height: getProportionateScreenHeight(20)),
                        Text('ORDER DETAILS',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenHeight(20),
                              color: Colors.black,
                            )),
                        Divider(thickness: 2),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: products.keys.length,
                            itemBuilder: ((context, index) {
                              return SummaryCard(
                                product: products.keys.elementAt(index),
                                quantity: products.values.elementAt(index),
                              );
                            }),
                          ),
                        ),
                        Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: kPrimaryColor,
                              ),
                              onPressed: () {
                                context.read<CartBloc>().add(ClearCart());
                                context.read<CheckoutBloc>().add(UpdateCheckout(
                                    user: context.read<AuthBloc>().state.user));

                                Navigator.of(context)
                                    .pushReplacementNamed(HomeScreen.routeName);
                              },
                              child: Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Text(
                                  'Back to Home',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
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
      ),
    );
  }
}

Map productQuantity(products) {
  var quantity = {};
  for (Product product in products) {
    if (!quantity.containsKey(product)) {
      quantity[product] = 1;
    } else {
      quantity[product] += 1;
    }
  }
  return quantity;
}
