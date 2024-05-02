import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_store_app1/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/progress_indicator/progress_indicator.dart';
import '../../../../logic/bloc/blocs.dart';
import 'hero_carousel_card.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(200),
      width: double.infinity,
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return buildProgressIndicator();
          }
          if (state is CategoryLoaded) {
            return CarouselSlider(
              options: CarouselOptions(
                initialPage: 0,
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: state.categories
                  .map((category) => HeroCarouselCard(category: category))
                  .toList(),
            );
          } else {
            return Text('Something Went Wrong!');
          }
        },
      ),
    );
  }
}
