import 'package:e_store_app1/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/size_config.dart';
import '../../../../core/components/progress_indicator/progress_indicator.dart';
import '../../../../data/models/category_model.dart';
import '../../../../logic/bloc/category/category_bloc.dart';
import '../../../widgets/section_title.dart';
import 'category_card.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<Map<String, dynamic>> categoriesIcon = [
    //   {"icon": "assets/icons/Flash Icon.svg", "text": "Men"},
    //   {"icon": "assets/icons/Bill Icon.svg", "text": "Women"},
    //   {"icon": "assets/icons/Game Icon.svg", "text": "Kids"},
    //   {"icon": "assets/icons/Gift Icon.svg", "text": "Sport"},
    //   {"icon": "assets/icons/Discover.svg", "text": "Classic"},
    // ];

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(18),
            vertical: getProportionateScreenHeight(0),
          ),
          child: SectionTitle(
            title: "Categories",
            showSeeMore: false,
            press: () {},
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenHeight(10),
          ),
          child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
            if (state is CategoryLoading) {
              return buildProgressIndicator();
            }
            if (state is CategoryLoaded) {
              final List<Category> categories = state.categories;
              return Container(
                height: getProportionateScreenHeight(90),
                width: double.infinity,
                alignment: Alignment.center,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      icon: categories[index].iconUrl,
                      text: categories[index].name,
                      press: () {
                        Navigator.of(context).pushNamed(CatalogScreen.routeName,
                            arguments: categories[index]);
                      },
                    );
                  },
                ),
              );
            } else {
              return Text('Something Went Wrong!');
            }
          }),
        ),
      ],
    );
  }
}
