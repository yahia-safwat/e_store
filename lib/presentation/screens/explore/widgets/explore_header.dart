import 'package:flutter/material.dart';

import 'package:e_store_app1/presentation/widgets/widgets.dart';

class ExploreHeader extends StatelessWidget {
  final String title;
  const ExploreHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      title: 'Explore',
      subtitle: title,
    );
  }
}
