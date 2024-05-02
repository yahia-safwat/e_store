import 'package:e_store_app1/core/components/dialog/login_dialog/login_dialog.dart';
import 'package:e_store_app1/core/components/snackbar/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../config/size_config.dart';
import '../../../../core/constants/constants.dart';
import '../../../../data/models/models.dart';
import '../../../../logic/bloc/blocs.dart';

class ExploreAction extends StatelessWidget {
  const ExploreAction({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        if (state is WishlistLoaded) {
          final User? user = context.read<AuthBloc>().state.user;
          return Container(
            margin: EdgeInsets.all(getProportionateScreenWidth(2)),
            padding: EdgeInsets.all(getProportionateScreenWidth(8)),
            height: getProportionateScreenWidth(35),
            width: getProportionateScreenWidth(35),
            decoration: BoxDecoration(
              color: product.favorites.contains(user?.id)
                  ? kPrimaryColor.withOpacity(0.15)
                  : kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () async {
                if (await InternetConnectionChecker().hasConnection) {
                  if (context.read<AuthBloc>().state.status ==
                      AuthStatus.authenticated) {
                    if (product.favorites.contains(user?.id)) {
                      product.favorites.remove(user?.id);
                      context.read<WishlistBloc>().add(
                          RemoveProductFromWishList(
                              product: product, user: user));
                    } else {
                      product.favorites.add(user?.id);
                      context.read<WishlistBloc>().add(
                          AddProductToWishList(product: product, user: user));
                    }
                  } else {
                    showLoginDialog(context);
                  }
                } else {
                  showCustomSnackbar(
                      context: context, message: 'You are offline!');
                }
              },
              icon: SvgPicture.asset(
                'assets/icons/Heart Icon_2.svg',
                height: getProportionateScreenHeight(12),
                width: getProportionateScreenWidth(12),
                color: product.favorites.contains(user?.id)
                    ? Color(0xFFFF4848)
                    : Color(0xFFDBDEE4),
              ),
              padding: EdgeInsets.zero,
            ),
          );
        } else {
          return Center(child: Text('Something Went Wrong'));
        }
      },
    );
  }
}
