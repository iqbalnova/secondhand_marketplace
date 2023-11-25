import 'package:flutter/material.dart';
import 'package:secondhand_marketplace/feature/account/presentation/screens/account_screen.dart';
import 'package:secondhand_marketplace/feature/account/presentation/screens/edit_account_screen.dart';
import 'package:secondhand_marketplace/feature/auth/presentation/screens/login_screen.dart';
import 'package:secondhand_marketplace/feature/auth/presentation/screens/register_screen.dart';
import 'package:secondhand_marketplace/feature/core/presentation/screens/main_screen.dart';
import 'package:secondhand_marketplace/feature/core/presentation/screens/splash_screen.dart';
import 'package:secondhand_marketplace/feature/seller/presentation/screens/preview_screen.dart';
import 'package:secondhand_marketplace/feature/seller/presentation/screens/sell_form_screen.dart';
import 'package:secondhand_marketplace/feature/seller/presentation/screens/selling_list_screen.dart';
import 'package:secondhand_marketplace/feature/seller/presentation/widgets/image_full_screen.dart';
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
            case AppRoutes.main:
              return const MainScreen();
            case AppRoutes.account:
              return const AccountScreen();
            case AppRoutes.editAccount:
              return const EditAccountScreen();
            case AppRoutes.sellingList:
              return const SellingList();
            case AppRoutes.sellForm:
              return const SellFormScreen();
            case AppRoutes.previewScreen:
              // CASE 1
              // final Map<String, dynamic> args =
              //     settings.arguments as Map<String, dynamic>;
              // final List<String> imgList = args['imgList'];
              // return PreviewScreen(imgList: imgList);

              // CASE 2
              final args = settings.arguments as Map<String, dynamic>;
              // final imgList = (args as Map<String, List<String>>)['imgList'];
              return PreviewScreen(
                imgList: args['imgList'],
                category: args['category'] as String,
                productName: args['productName'] as String,
                price: args['price'] as String,
                description: args['description'] as String,
              );
            case AppRoutes.imageFullScreen:
              final args = settings.arguments as Map<String, dynamic>;
              return FullscreenImageScreen(
                imagePath: args['imagePath'],
                imgList: args['imgList'],
                initialPage: args['initialPage'],
              );
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
