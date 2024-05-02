import 'package:flutter/material.dart';

import '../../../../core/components/components.dart';
import '../../../../core/enums/enums.dart';
import '../../../widgets/coustom_bottom_nav_bar.dart';
import 'widgets/body.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Scaffold(
        // appBar: AppBar(title: Text("Sign In")),
        body: Body(),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../config/size_config.dart';
// import '../../../../core/enums/enums.dart';
// import '../../../../logic/cubit/cubits.dart';
// import '../../../widgets/coustom_bottom_nav_bar.dart';

// class SignInScreen extends StatelessWidget {
//   static const String routeName = '/login';

//   static Route route() {
//     return MaterialPageRoute(
//       settings: RouteSettings(name: routeName),
//       builder: (context) => SignInScreen(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       // appBar: CustomAppBar(title: 'Login'),
//       // bottomNavigationBar: CustomNavBar(screen: routeName),
//       // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),

//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _EmailInput(),
//             const SizedBox(height: 10),
//             _PasswordInput(),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 context.read<LoginCubit>().logInWithCredentials();
//               },
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(),
//                 primary: Colors.black,
//                 fixedSize: Size(200, 40),
//               ),
//               child: Text(
//                 'Login',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             _GoogleLoginButton(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _EmailInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginCubit, LoginState>(
//       buildWhen: (previous, current) => previous.email != current.email,
//       builder: (context, state) {
//         return TextField(
//           onChanged: (email) {
//             context.read<LoginCubit>().emailChanged(email);
//           },
//           decoration: const InputDecoration(labelText: 'Email'),
//         );
//       },
//     );
//   }
// }

// class _PasswordInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginCubit, LoginState>(
//       buildWhen: (previous, current) => previous.password != current.password,
//       builder: (context, state) {
//         return TextField(
//           onChanged: (password) {
//             context.read<LoginCubit>().passwordChanged(password);
//           },
//           decoration: const InputDecoration(labelText: 'Password'),
//           obscureText: true,
//         );
//       },
//     );
//   }
// }

// class _GoogleLoginButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         context.read<LoginCubit>().logInWithGoogle();
//       },
//       style: ElevatedButton.styleFrom(
//         shape: RoundedRectangleBorder(),
//         primary: Colors.white,
//         fixedSize: Size(200, 40),
//       ),
//       child: Text(
//         'Sign In with Google',
//         style: TextStyle(
//           color: Colors.black,
//         ),
//       ),
//     );
//   }
// }

