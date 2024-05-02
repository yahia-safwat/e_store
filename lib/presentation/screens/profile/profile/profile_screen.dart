import 'package:flutter/material.dart';
import '../../../../core/components/components.dart';
import '../../../../presentation/widgets/coustom_bottom_nav_bar.dart';
import '../../../../core/enums/enums.dart';

import '../../../widgets/widgets.dart';
import 'widgets/body.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = "/profile";

  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Scaffold(
        // appBar: AppBar(title: Text("Profile")),
        body: CustomBody(
          child: Body(),
        ),
        bottomNavigationBar:
            CustomBottomNavBar(selectedMenu: MenuState.profile),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/enums/enums.dart';
// import '../../../../data/repositories/repositories.dart';
// import '../../../../logic/bloc/blocs.dart';
// import '../../../widgets/coustom_bottom_nav_bar.dart';
// import '../../home/widgets/custom_text_form_field.dart';

// class ProfileScreen extends StatelessWidget {
//   static const String routeName = '/profile';

//   static Route route() {
//     return MaterialPageRoute(
//       settings: RouteSettings(name: routeName),
//       builder: (context) => BlocProvider<ProfileBloc>(
//         create: (context) => ProfileBloc(
//           authBloc: BlocProvider.of<AuthBloc>(context),
//           userRepository: context.read<UserRepository>(),
//         )..add(
//             LoadProfile(context.read<AuthBloc>().state.authUser),
//           ),
//         child: ProfileScreen(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: CustomAppBar(title: 'Profile'),
//       // bottomNavigationBar: CustomNavBar(screen: routeName),
//       bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),

//       body: BlocBuilder<ProfileBloc, ProfileState>(
//         builder: (context, state) {
//           if (state is ProfileLoading) {
//             return Center(
//               child: CircularProgressIndicator(color: Colors.black),
//             );
//           }
//           if (state is ProfileLoaded) {
//             return Padding(
//               padding: const EdgeInsets.all(60.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'CUSTOMER INFORMATION',
//                     style: TextStyle(),
//                   ),
//                   const SizedBox(height: 10),
//                   CustomTextFormField(
//                     title: 'Email',
//                     initialValue: state.user.email,
//                     onChanged: (value) {
//                       context.read<ProfileBloc>().add(
//                             UpdateProfile(
//                               user: state.user.copyWith(email: value),
//                             ),
//                           );
//                     },
//                   ),
//                   const SizedBox(height: 5),
//                   CustomTextFormField(
//                     title: 'Full Name',
//                     initialValue: state.user.fullName,
//                     onChanged: (value) {
//                       context.read<ProfileBloc>().add(
//                             UpdateProfile(
//                               user: state.user.copyWith(fullName: value),
//                             ),
//                           );
//                     },
//                   ),
//                   const SizedBox(height: 5),
//                   CustomTextFormField(
//                     title: 'Address',
//                     initialValue: state.user.address,
//                     onChanged: (value) {
//                       context.read<ProfileBloc>().add(
//                             UpdateProfile(
//                               user: state.user.copyWith(address: value),
//                             ),
//                           );
//                     },
//                   ),
//                   const SizedBox(height: 5),
//                   CustomTextFormField(
//                     title: 'City',
//                     initialValue: state.user.city,
//                     onChanged: (value) {
//                       context.read<ProfileBloc>().add(
//                             UpdateProfile(
//                               user: state.user.copyWith(city: value),
//                             ),
//                           );
//                     },
//                   ),
//                   const SizedBox(height: 5),
//                   CustomTextFormField(
//                     title: 'Country',
//                     initialValue: state.user.country,
//                     onChanged: (value) {
//                       context.read<ProfileBloc>().add(
//                             UpdateProfile(
//                               user: state.user.copyWith(country: value),
//                             ),
//                           );
//                     },
//                   ),
//                   const SizedBox(height: 5),
//                   CustomTextFormField(
//                     title: 'ZIP Code',
//                     initialValue: state.user.zipCode,
//                     onChanged: (value) {
//                       context.read<ProfileBloc>().add(
//                             UpdateProfile(
//                               user: state.user.copyWith(zipCode: value),
//                             ),
//                           );
//                     },
//                   ),
//                   SizedBox(height: 30),
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         context.read<AuthRepository>().signOut();
//                       },
//                       style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(),
//                         primary: Colors.black,
//                         fixedSize: Size(200, 40),
//                       ),
//                       child: Text(
//                         'Sign Out',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }
//           if (state is ProfileUnauthenticated) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   width: double.infinity,
//                   child: Center(
//                     child: Text(
//                       'You are not logged in!',
//                       style: TextStyle(),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/sign_in');
//                   },
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(),
//                     primary: Colors.black,
//                     fixedSize: Size(200, 40),
//                   ),
//                   child: Text(
//                     'Login',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/sign_up');
//                     context.read<AuthRepository>().signOut();
//                   },
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(),
//                     primary: Colors.white,
//                     fixedSize: Size(200, 50),
//                   ),
//                   child: Text(
//                     'Signup',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ),
//               ],
//             );
//           } else {
//             return Text('Something went wrong');
//           }
//         },
//       ),
//     );
//   }
// }
