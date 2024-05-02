import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../core/components/dialog/login_dialog/login_dialog.dart';
import '../../core/components/snackbar/custom_snackbar.dart';
import '../../logic/bloc/blocs.dart';
import '../screens/home/widgets/icon_btn_with_counter.dart';
import '../screens/screens.dart';

class CartIconWithCounter extends StatelessWidget {
  const CartIconWithCounter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            numOfitem: state.user?.cart.length ?? 0,
            press: () async {
              if (await InternetConnectionChecker().hasConnection) {
                if (context.read<AuthBloc>().state.status ==
                    AuthStatus.authenticated) {
                  Navigator.pushNamed(context, CartScreen.routeName);

                  Navigator.of(context).pushNamed('/cart');
                } else {
                  showLoginDialog(context);
                }
              } else {
                showCustomSnackbar(
                    context: context, message: 'You are offline!');
              }
            },
          );
        } else {
          return IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            numOfitem: 0,
            press: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
          );
        }
      },
    );
  }
}
