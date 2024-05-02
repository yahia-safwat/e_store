import 'package:flutter/material.dart';

import 'package:e_store_app1/config/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../logic/bloc/blocs.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ProfileLoading) {
          return Center(
            child: CircularProgressIndicator(color: Colors.black),
          );
        }
        if (state is ProfileLoaded) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(40)),
                ProfilePic(),
                SizedBox(height: 20),
                ProfileMenu(
                  text: "My Account: ${state.user.email}",
                  icon: "assets/icons/User Icon.svg",
                  press: () => {},
                ),
                ProfileMenu(
                  text: "Notifications",
                  icon: "assets/icons/Bell.svg",
                  press: () {},
                ),
                ProfileMenu(
                  text: "Settings",
                  icon: "assets/icons/Settings.svg",
                  press: () {},
                ),
                ProfileMenu(
                  text: "Help Center",
                  icon: "assets/icons/Question mark.svg",
                  press: () {},
                ),
                ProfileMenu(
                  text: "Log Out",
                  icon: "assets/icons/Log out.svg",
                  press: () {},
                ),
              ],
            ),
          );
        } else {
          return Text('Something went wrong');
        }
      },
    );
  }
}
