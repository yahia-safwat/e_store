import 'package:e_store_app1/core/components/progress_indicator/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/bloc/blocs.dart';
import 'login_required.dart';

class CustomBody extends StatelessWidget {
  final Widget child;
  const CustomBody({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          return child;
        }
        if (state.status == AuthStatus.unauthenticated) {
          return LoginRequired();
        } else {
          return buildProgressIndicator();
        }
      },
    );
  }
}
