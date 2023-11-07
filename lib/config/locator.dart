import 'package:get_it/get_it.dart';
import 'package:secondhand_marketplace/config/api_client.dart';
import 'package:secondhand_marketplace/routes/app_router.dart';

class Locator {
  static final getIt = GetIt.instance;

  void setupDepedencyInjection() {
    getIt.registerSingleton<AppRouter>(AppRouter());
    getIt.registerSingleton<ApiClient>(ApiClient());
  }
}
