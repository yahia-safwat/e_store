import 'package:flutter/material.dart';

import '../../../../config/size_config.dart';
import '../../../../data/models/models.dart';
import '../../screens.dart';
import 'wishlist_action.dart';
import 'wishlist_image.dart';
import 'wishlist_information.dart';

class WishlistProductCard extends StatelessWidget {
  const WishlistProductCard({Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
      child: Container(
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(6),
          top: getProportionateScreenHeight(6),
          right: getProportionateScreenWidth(12),
          bottom: getProportionateScreenHeight(6),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 2.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    DetailsScreen.routeName,
                    arguments: {
                      'product': product,
                    },
                  );
                },
                child: Row(
                  children: [
                    WishlistImage(
                      width: getProportionateScreenWidth(80),
                      height: getProportionateScreenHeight(70),
                      product: product,
                    ),
                    SizedBox(width: getProportionateScreenWidth(10)),
                    WishlistInformation(product: product),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: WishlistAction(product: product),
            ),
          ],
        ),
      ),
    );

    //  Padding(
    //   padding: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
    //   child: Container(
    //     padding: EdgeInsets.symmetric(
    //       vertical: getProportionateScreenHeight(4),
    //       horizontal: getProportionateScreenWidth(12),
    //     ),
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.all(
    //         Radius.circular(10),
    //       ),
    //       boxShadow: [
    //         BoxShadow(
    //           color: Colors.black12,
    //           spreadRadius: 1,
    //           blurRadius: 2.0,
    //         ),
    //       ],
    //     ),
    //     child: InkWell(
    //       onTap: () {
    //         Navigator.of(context).pushNamed(
    //           DetailsScreen.routeName,
    //           arguments: product,
    //         );
    //       },
    //       child: Row(
    //         children: <Widget>[
    //           Container(
    //             width: getProportionateScreenWidth(110),
    //             height: getProportionateScreenHeight(75),
    //             padding: EdgeInsets.all(getProportionateScreenWidth(10)),
    //             decoration: BoxDecoration(
    //               color: kSecondaryColor.withOpacity(0.1),
    //               borderRadius: BorderRadius.circular(15),
    //             ),
    //             child: Hero(
    //               tag: product.id.toString(),
    //               child: Image.network(
    //                 product.images[0],
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //           ),
    //           SizedBox(width: 10),
    //           Expanded(
    //             flex: 3,
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: <Widget>[
    //                 Container(
    //                   width: MediaQuery.of(context).size.width * .4,
    //                   child: Text(
    //                     product.name,
    //                     maxLines: 1,
    //                     overflow: TextOverflow.ellipsis,
    //                     style: TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: getProportionateScreenHeight(13),
    //                     ),
    //                   ),
    //                 ),
    //                 Text(
    //                   '\$${product.price.toString()}',
    //                   style: TextStyle(
    //                     color: Colors.black26,
    //                     height: 1.5,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Expanded(
    //             flex: 2,
    //             child: BlocBuilder<WishlistBloc, WishlistState>(
    //               builder: (context, state) {
    //                 if (state is WishlistLoaded) {
    //                   return Container(
    //                     margin: EdgeInsets.all(getProportionateScreenWidth(2)),
    //                     padding: EdgeInsets.all(getProportionateScreenWidth(8)),
    //                     height: getProportionateScreenWidth(40),
    //                     width: getProportionateScreenWidth(40),
    //                     decoration: BoxDecoration(
    //                       color: kSecondaryColor.withOpacity(0.1),
    //                       shape: BoxShape.circle,
    //                     ),
    //                     child: IconButton(
    //                       onPressed: () {
    //                         context.read<WishlistBloc>().add(
    //                             RemoveProductFromWishList(product: product));

    //                         // showCustomSnackbar(
    //                         //     context: context,
    //                         //     message: 'Removed From Wishlist!');
    //                       },
    //                       icon: SvgPicture.asset(
    //                         'assets/icons/Trash.svg',
    //                         height: getProportionateScreenHeight(12),
    //                         width: getProportionateScreenWidth(12),
    //                       ),
    //                       padding: EdgeInsets.zero,
    //                     ),
    //                   );
    //                 } else {
    //                   return Center(child: Text('Something Went Wrong'));
    //                 }
    //               },
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
