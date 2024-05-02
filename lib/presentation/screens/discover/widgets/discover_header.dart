import 'package:e_store_app1/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DiscoverHeader extends StatelessWidget {
  const DiscoverHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      title: 'Explore',
      subtitle: 'Special for you',
      showSearchIcon: true,
    );
  }
}
