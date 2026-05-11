
import 'package:connectify/core/routes/app_routes.dart';
import 'package:connectify/features/auth/view/login/login_screen.dart';
import 'package:connectify/features/auth/view/signup/signup_screen.dart';
import 'package:connectify/features/chat/chat_screen.dart';
import 'package:connectify/features/home/home_screen.dart';
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
    GetPage(
        name: AppRoutes.Signup,
        page: () => SignupScreen()
    ),
    GetPage(
        name: AppRoutes.Home,
        page: () => HomeScreen()
    ),
    GetPage(
        name: AppRoutes.Chat,
        page: () => ChatScreen(user: '',)
    )

  ];
}