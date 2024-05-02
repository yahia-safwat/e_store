import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../config/size_config.dart';
import '../../../../core/components/dialog/login_dialog/login_dialog.dart';
import '../../../../core/components/snackbar/custom_snackbar.dart';
import '../../../../core/constants/constants.dart';
import '../../../../data/models/models.dart';
import '../../../../logic/bloc/blocs.dart';

class WishlistAction extends StatelessWidget {
  const WishlistAction({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        if (state is WishlistLoaded) {
          final user = context.read<AuthBloc>().state.user;
          return Container(
            margin: EdgeInsets.all(getProportionateScreenWidth(2)),
            padding: EdgeInsets.all(getProportionateScreenWidth(8)),
            height: getProportionateScreenWidth(35),
            width: getProportionateScreenWidth(35),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () async {
                if (await InternetConnectionChecker().hasConnection) {
                  if (context.read<AuthBloc>().state.status ==
                      AuthStatus.authenticated) {
                    product.favorites.remove(user!.id);
                    context.read<WishlistBloc>().add(RemoveProductFromWishList(
                        product: product, user: user));
                  } else {
                    showLoginDialog(context);
                  }
                } else {
                  showCustomSnackbar(
                      context: context, message: 'You are offline!');
                }
              },
              icon: SvgPicture.asset(
                'assets/icons/Trash.svg',
                height: getProportionateScreenHeight(13),
                width: getProportionateScreenWidth(13),
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
