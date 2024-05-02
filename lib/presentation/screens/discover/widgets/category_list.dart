// ignore_for_file: unused_import

import 'package:animate_do/animate_do.dart';
import 'package:e_store_app1/config/size_config.dart';
import 'package:e_store_app1/core/components/progress_indicator/progress_indicator.dart';
import 'package:e_store_app1/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../logic/bloc/blocs.dart';
import '../../../widgets/section_title.dart';
import '../../home/widgets/product_carousel.dart';
import 'category_item.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return buildProgressIndicator();
        }
        if (state is CategoryLoaded) {
          final List<Category> categories = state.categories;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryItem(
                        category: categories[index],
                      );
                    },
                  ),
                ),
                SizedBox(),
              ],
            ),
          );
        } else {
          return Text('Something Went Wrong!');
        }
      },
    );
  }
}
