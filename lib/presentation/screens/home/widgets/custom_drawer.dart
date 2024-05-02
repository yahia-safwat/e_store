import 'package:e_store_app1/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repositories/repositories.dart';
import '../../profile/profile/widgets/profile_menu.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(7.0, 70, 7, 0),
          child: Column(
            children: [
              headerWidget(),
              SizedBox(height: 20),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              SizedBox(height: 10),
              ProfileMenu(
                text: "My Account",
                icon: "assets/icons/User Icon.svg",
                press: () => {},
                disableColor: true,
              ),
              ProfileMenu(
                text: "Notifications",
                icon: "assets/icons/Bell.svg",
                press: () {},
                disableColor: true,
              ),
              ProfileMenu(
                text: "About",
                icon: "assets/icons/Question mark.svg",
                press: () {},
                disableColor: true,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              ProfileMenu(
                text: "Settings",
                icon: "assets/icons/Settings.svg",
                press: () {},
                disableColor: true,
              ),
              ProfileMenu(
                text: "Log Out",
                icon: "assets/icons/Log out.svg",
                press: () {
                  context.read<AuthRepository>().signOut();
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(SignInScreen.routeName);
                },
                disableColor: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage("assets/images/Profile Image.png"),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Person name',
                  style: TextStyle(fontSize: 14, color: Colors.black)),
              SizedBox(
                height: 10,
              ),
              Text('person@email.com',
                  style: TextStyle(fontSize: 14, color: Colors.black))
            ],
          )
        ],
      ),
    );
  }
}
