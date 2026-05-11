
import 'package:connectify/features/auth/view/login/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40.w),
          width: double.maxFinite,
          height: 700.h,
          decoration: BoxDecoration(
            color: Colors.orangeAccent.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20.r)
          ),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40.r,
                    child: Icon(Icons.login_outlined,size: 40.h,color: Colors.orange,),
                  ),
                ),
                SizedBox(height: 10.h,),
                Center(child: Text("Welcome to Login Screen")),
                SizedBox(height: 20.h,),
                //loginForm
                LoginForm(),
                SizedBox(height: 20.h,),
                const Center(child: Text("OR")),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: (){
                          //Later update
                          Get.snackbar("Login", "Facebook SignIn Action perform");
                        },
                        icon: Icon(Icons.facebook_outlined,size: 40.h,)
                    ),
                    IconButton(
                        onPressed: (){
                          //Later update
                          Get.snackbar("Login", "Google sing in Action perform");
                        },
                        icon: Icon(Icons.g_mobiledata_outlined,size: 40.h,)
                    ),

                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}