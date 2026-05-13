
import 'dart:async';

import 'package:connectify/core/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    checkUser();
    super.onInit();
  }

  void checkUser(){
    Timer(Duration(seconds: 3), (){
      User? user = FirebaseAuth.instance.currentUser;
      if( user != null){
        Get.toNamed(AppRoutes.Home);
      }
      else{
        Get.offAllNamed(AppRoutes.Login);
      }
    });
  }

}