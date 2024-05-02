import 'package:e_store_app1/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../core/components/dialog/login_dialog/login_dialog.dart';
import '../../core/components/snackbar/custom_snackbar.dart';
import '../../data/models/product_model.dart';
import '../../logic/bloc/blocs.dart';
import '../../presentation/screens/details/details_screen.dart';

import '../../core//constants/constants.dart';
import '../../config/size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
    required this.tag,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: {
              'product': product,
              'tag': tag,
            },
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // child: Image.network(
                  //   product.images[0],
                  //   fit: BoxFit.cover,
                  // ),
                  child: Hero(
                    tag: tag,
                    child: Image.network(
                      product.images[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.name,
                style: TextStyle(color: Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(14),
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor,
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: BlocBuilder<WishlistBloc, WishlistState>(
                        builder: (context, state) {
                          if (state is WishlistLoaded) {
                            final User? user =
                                context.read<AuthBloc>().state.user;
                            return InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () async {
                                if (await InternetConnectionChecker()
                                    .hasConnection) {
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
                                      context: context,
                                      message: 'You are offline!');
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(
                                    getProportionateScreenWidth(8)),
                                height: getProportionateScreenWidth(28),
                                width: getProportionateScreenWidth(28),
                                decoration: BoxDecoration(
                                  color: product.favorites.contains(user?.id)
                                      ? kPrimaryColor.withOpacity(0.15)
                                      : kSecondaryColor.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  "assets/icons/Heart Icon_2.svg",
                                  color: product.favorites.contains(user?.id)
                                      ? Color(0xFFFF4848)
                                      : Color(0xFFDBDEE4),
                                ),
                              ),
                            );
                          } else {
                            return Center(child: Text('Something Went Wrong'));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
