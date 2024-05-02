import 'package:e_store_app1/data/models/user_model.dart';
import 'package:e_store_app1/presentation/screens/details/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../core/components/dialog/login_dialog/login_dialog.dart';
import '../../../../core/components/snackbar/custom_snackbar.dart';
import '../../../../data/models/product_model.dart';

import '../../../../config/size_config.dart';
import '../../../../logic/bloc/blocs.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: getProportionateScreenHeight(14)),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Text(
                product.name,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Color(0XFF8B8B8B),
                      fontSize: 18,
                    ),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  if (state is WishlistLoaded) {
                    final User? user = context.read<AuthBloc>().state.user;
                    return InkWell(
                        onTap: () async {
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
                                    AddProductToWishList(
                                        product: product, user: user));
                              }
                            } else {
                              showLoginDialog(context);
                            }
                          } else {
                            showCustomSnackbar(
                                context: context, message: 'You are offline!');
                          }
                        },
                        child: Container(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(15)),
                          width: getProportionateScreenWidth(64),
                          decoration: BoxDecoration(
                            color: product.favorites.contains(user?.id)
                                ? Color(0xFFFFE6E6)
                                : Color(0xFFF5F6F9),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/Heart Icon_2.svg",
                            color: product.favorites.contains(user?.id)
                                ? Color(0xFFFF4848)
                                : Color(0xFFDBDEE4),
                            height: getProportionateScreenWidth(16),
                          ),
                        ));
                  } else {
                    return Center(child: Text('Something Went Wrong'));
                  }
                },
              ),
            ),
          ],
        ),
        SizedBox(height: getProportionateScreenHeight(16)),
        ExpandableText(text: product.description),
      ],
    );
  }
}
