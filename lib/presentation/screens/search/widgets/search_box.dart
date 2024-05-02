import 'package:e_store_app1/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/size_config.dart';
import '../../../../core/constants/constants.dart';
import '../../../../logic/bloc/blocs.dart';

class SearchBox extends StatelessWidget {
  final Category? category;
  const SearchBox({Key? key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: context.read<SearchBloc>().searchEditingController,
        onChanged: (value) {
          context.read<SearchBloc>().add(SearchProduct(
                productName: value,
                category: category,
              ));
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search product",
            prefixIcon: InkWell(
              child: Icon(Icons.arrow_back),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            suffixIcon: InkWell(
              child: Icon(
                Icons.close,
              ),
              onTap: () {
                context.read<SearchBloc>().searchEditingController.text = '';
                context.read<SearchBloc>().add(SearchProduct(
                      productName: '',
                      category: category,
                    ));
              },
            )),
      ),
    );
  }
}
