import 'package:e_store_app1/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WishlistHeader extends StatelessWidget {
  const WishlistHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      title: 'Explore',
      subtitle: 'your favorite products',
    );
  }
}
