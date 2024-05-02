import 'package:e_store_app1/presentation/screens/discover/discover_screen.dart';
import 'package:e_store_app1/presentation/screens/explore/explore_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/models.dart';
import '../../data/repositories/repositories.dart';
import '../../logic/bloc/auth/auth_bloc.dart';
import '../../logic/bloc/profile/profile_bloc.dart';
import '../screens/screens.dart';

class AppRouter {
  AppRouter();

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );

      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );

      case BoardingScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => BoardingScreen(),
        );

      case SignInScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => SignInScreen(),
        );

      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ForgotPasswordScreen(),
        );

      case LoginSuccessScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => LoginSuccessScreen(),
        );

      case SignUpScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(),
        );

      case CompleteProfileScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => CompleteProfileScreen(),
        );

      case OtpScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => OtpScreen(),
        );

      case DetailsScreen.routeName:
        final args = settings.arguments as Map;
        final Product product = args['product'] as Product;
        final String? tag = args['tag'] as String?;
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(product: product, tag: tag),
        );

      case CartScreen.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return CartScreen();
          },
        );

      case DiscoverScreen.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return DiscoverScreen();
          },
        );

      case ExploreScreen.routeName:
        final Map args = settings.arguments as Map<String, dynamic>;
        final String title = args['title'] as String;

        return MaterialPageRoute(
          builder: (context) {
            return ExploreScreen(title: title);
          },
        );

      case ProfileScreen.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider<ProfileBloc>(
              create: (context) => ProfileBloc(
                authBloc: BlocProvider.of<AuthBloc>(context),
                userRepository: context.read<UserRepository>(),
              )..add(
                  LoadProfile(
                      authUser: context.read<AuthBloc>().state.authUser),
                ),
              child: ProfileScreen(),
            );
          },
        );

      case CatalogScreen.routeName:
        final Category category = settings.arguments as Category;
        return MaterialPageRoute(
          builder: (_) => CatalogScreen(category: category),
        );

      case CheckoutScreen.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return CheckoutScreen();
          },
        );

      case OrdersScreen.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return OrdersScreen();
          },
        );

      case OrderConfirmationScreen.routeName:
        final order = settings.arguments as Order;
        return MaterialPageRoute(
          builder: (_) => OrderConfirmationScreen(order: order),
        );

      case OrderDetailsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => OrderDetailsScreen(),
        );

      case WishlistScreen.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return WishlistScreen();
          },
        );

      case SearchScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => SearchScreen(),
        );

      default:
        return errorRout(settings);
    }
  }

  Route? errorRout(settings) {
    settings = RouteSettings(name: '/error');
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Error',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: Center(
          child: Text('Route Error!'),
        ),
      ),
    );
  }
}
