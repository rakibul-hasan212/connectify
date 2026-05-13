import 'package:connectify/features/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget{
  final SplashController controller = Get.put(SplashController());
  SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40.r,
              child: Icon(Icons.account_circle_outlined,size: 40.h,),
            ),
            SizedBox(height: 20.h,),
            const Text("Welcome to Connectify!!"),
          ],
        ),
      ),

    );
  }
}