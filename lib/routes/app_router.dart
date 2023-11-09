import 'package:flutter/material.dart';
import 'package:secondhand_marketplace/feature/account/presentation/screens/account_screen.dart';
import 'package:secondhand_marketplace/feature/auth/presentation/screens/login_screen.dart';
import 'package:secondhand_marketplace/feature/auth/presentation/screens/register_screen.dart';
import 'package:secondhand_marketplace/feature/core/presentation/screens/splash_screen.dart';
import 'package:secondhand_marketplace/routes/app_routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      return Builder(
        builder: (BuildContext context) {
          switch (settings.name) {
            case AppRoutes.splash:
              return const SplashScreen();
            case AppRoutes.login:
              return const LoginScreen();
            case AppRoutes.register:
              return const RegisterScreen();
            case AppRoutes.account:
              return const AccountScreen();
            default:
              return const Scaffold(
                body: Center(
                  child: Text(
                    'Check Named Routes',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
              );
          }
        },
      );
    });
  }
}
