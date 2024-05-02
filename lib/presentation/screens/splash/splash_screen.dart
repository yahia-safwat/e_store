import 'dart:async';
import 'package:e_store_app1/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/size_config.dart';
import '../../../data/services/services.dart';
import '../../../logic/bloc/blocs.dart';
import 'widgets/body.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Timer(Duration(seconds: 1), () async {
      bool? isFreshInstalled = await getStatus();
      isFreshInstalled = false; // temp

      if (isFreshInstalled == false) {
        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.routeName, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, BoardingScreen.routeName, (route) => false);
      }
    });

    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous.authUser != current.authUser,
      listener: (context, state) {
        print('Splash screen Auth Listener');
      },
      child: Scaffold(
        body: Body(),
      ),
    );
  }

  Future<bool?> getStatus() async {
    return await CacheHelper.getBool(key: 'isFreshInstalled');
  }
}
