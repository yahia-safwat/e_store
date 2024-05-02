import 'package:e_store_app1/core/components/progress_indicator/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../logic/bloc/blocs.dart';
import '../../../../../presentation/widgets/default_button.dart';
import '../../../../../config/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          return Center(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Image.asset(
                  "assets/images/success.png",
                  height: SizeConfig.screenHeight * 0.4, //40%
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Text(
                  "Login Success",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(30),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: SizeConfig.screenWidth * 0.6,
                  child: DefaultButton(
                    text: "Back",
                    press: () {
                      Navigator.of(context).pop();
                      // Navigator.of(context).pushNamedAndRemoveUntil(
                      //     HomeScreen.routeName, (route) => false);
                    },
                  ),
                ),
                Spacer(),
              ],
            ),
          );
        } else {
          return buildProgressIndicator();
        }
      },
    );
  }
}
