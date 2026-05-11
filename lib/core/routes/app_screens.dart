
import 'package:connectify/core/routes/app_routes.dart';
import 'package:connectify/features/login/view/login_screen.dart';
import 'package:connectify/features/splash/view/splash_screen.dart';

import 'package:get/get.dart';

class AppScreens {
  static final routes = [
    GetPage(
        name: AppRoutes.Splash,
        page: ()=> SplashScreen()
    ),
    GetPage(
        name: AppRoutes.Login,
        page: () => LoginScreen()
    ),

  ];
}