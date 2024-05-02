// ignore_for_file: unused_import

import 'package:e_store_app1/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../logic/bloc/blocs.dart';
import 'default_button.dart';

import '../../core/constants/constants.dart';
import '../../config/size_config.dart';
import '../screens/cart/widgets/order_summary.dart';

class CheckoutCard extends StatelessWidget {
  final String text;
  final Function? press;
  const CheckoutCard({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(2),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderSummary(),
            // Row(
            //   children: [
            //     Container(
            //       padding: EdgeInsets.all(10),
            //       height: getProportionateScreenWidth(40),
            //       width: getProportionateScreenWidth(40),
            //       decoration: BoxDecoration(
            //         color: Color(0xFFF5F6F9),
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: SvgPicture.asset("assets/icons/receipt.svg"),
            //     ),
            //     Spacer(),
            //     Text("Add voucher code"),
            //     const SizedBox(width: 10),
            //     Icon(
            //       Icons.arrow_forward_ios,
            //       size: 12,
            //       color: kTextColor,
            //     )
            //   ],
            // ),
            SizedBox(height: getProportionateScreenHeight(14)),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoaded) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Items:\n",
                          children: [
                            TextSpan(
                              text: state.user!.cart.length.toString(),
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(190),
                        child: DefaultButton(
                          text: text,
                          press: press,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Text('Something Went Wrong');
                }
              },
            ),
            SizedBox(height: getProportionateScreenHeight(8)),
          ],
        ),
      ),
    );
  }
}
