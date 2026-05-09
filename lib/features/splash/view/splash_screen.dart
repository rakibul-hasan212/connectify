
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectify/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Welcome to Connectify!!"),
            SizedBox(height: 40,),
            CircularProgressIndicator(),
            ElevatedButton(
                onPressed: (){
                  Get.toNamed(AppRoutes.Login);
                },
                child: Text("Next")
            )
          ],
        ),
      ),

    );
  }

}