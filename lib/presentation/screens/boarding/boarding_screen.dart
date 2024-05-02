import 'package:e_store_app1/logic/cubit/boarding/boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/body.dart';

class BoardingScreen extends StatelessWidget {
  static const String routeName = "/boarding";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    return BlocProvider(
      create: (context) => BoardingCubit(),
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}
