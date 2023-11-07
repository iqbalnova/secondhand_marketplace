import 'package:flutter/material.dart';
import 'package:secondhand_marketplace/app.dart';
import 'package:secondhand_marketplace/config/locator.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final locator = Locator();

  locator.setupDepedencyInjection();

  runApp(MyApp(
    navigatorKey: navigatorKey,
  ));
}
