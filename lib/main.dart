import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:secondhand_marketplace/app.dart';
import 'package:secondhand_marketplace/config/locator.dart';
import 'package:secondhand_marketplace/firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final locator = Locator();

  locator.setupDepedencyInjection();

  runApp(MyApp(
    navigatorKey: navigatorKey,
  ));
}
