import 'package:e_store_app1/core/components/snackbar/network_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/components/progress_indicator/progress_indicator.dart';
import '../../../../data/models/models.dart';
import '../../../../logic/bloc/blocs.dart';
import '../../../widgets/check_out_card.dart';
import '../../screens.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        if (state is CheckoutLoading) {
          return buildProgressIndicator();
        }
        if (state is CheckoutLoaded) {
          final checkoutState =
              (context.read<CheckoutBloc>().state as CheckoutLoaded);

          final CartBloc _cartBloc = context.read<CartBloc>();
          final products = List<Product>.from(context
              .read<AuthBloc>()
              .state
              .user!
              .cart
              .map((e) => Product.fromMap(e)));
          return CheckoutCard(
            text: 'Order Now',
            press: () async {
              if (context.read<AuthBloc>().state.status ==
                  AuthStatus.authenticated) {
                if (await InternetConnectionChecker().hasConnection) {
                  if (context
                      .read<CheckoutBloc>()
                      .checkoutformKey
                      .currentState!
                      .validate()) {
                    context
                        .read<CheckoutBloc>()
                        .add(ConfirmCheckout(checkout: state.checkout));

                    Navigator.of(context).pushNamedAndRemoveUntil(
                      OrderConfirmationScreen.routeName,
                      (route) => false,
                      arguments: Order(
                        orderCode: checkoutState.orderCode,
                        customerName: checkoutState.customerName,
                        customerPhone: checkoutState.customerPhone,
                        customerCity: checkoutState.customerCity,
                        products: products,
                        subtotal: _cartBloc.subTotal.toStringAsFixed(0),
                        deliveryFee: _cartBloc.deliveryFee().toStringAsFixed(0),
                        total: _cartBloc.total().toStringAsFixed(0),
                        createdAt: checkoutState.createdAt,
                      ),
                    );
                  }
                } else {
                  showNetworkSnackbar(context: context);
                }
              }
            },
          );
        } else {
          return Text('Something Went Wrong!');
        }
      },
    );
  }
}

// Map productQuantity(products) {
//   var quantity = {};
//   for (Product product in products) {
//     if (!quantity.containsKey(product)) {
//       quantity[product] = 1;
//     } else {
//       quantity[product] += 1;
//     }
//   }
//   return quantity;
// }
