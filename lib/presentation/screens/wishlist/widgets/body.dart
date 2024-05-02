// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/progress_indicator/progress_indicator.dart';
import '../../../../logic/bloc/blocs.dart';
import '../../../widgets/widgets.dart';
import 'wishlist_header.dart';
import 'wishlist_products.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          WishlistHeader(),
          WishlistProducts(),
        ],
      ),
    );
  }
}
