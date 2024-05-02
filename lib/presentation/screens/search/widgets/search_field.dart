import 'package:e_store_app1/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/category_model.dart';
import '../../../../logic/bloc/search/search_bloc.dart';
import 'products_field.dart';
import 'search_box.dart';

class SearchField extends StatelessWidget {
  final Category? category;

  const SearchField({
    Key? key,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }
        if (state is SearchLoaded) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenHeight(4),
            ),
            child: Column(
              children: [
                SearchBox(),
                SizedBox(height: getProportionateScreenHeight(12)),
                state.products.isNotEmpty
                    ? ProductsField(
                        products: state.products,
                      )
                    : const SizedBox(),
              ],
            ),
          );
        } else {
          return Text('Something went wrong.');
        }
      },
    );
  }
}
