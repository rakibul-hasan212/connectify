
import 'package:connectify/core/widgets/button/app_button.dart';
import 'package:connectify/core/widgets/textFormFeild/app_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                const Text("Email"),
                AppTextFormFeild(
                  controller: emailController,
                  hintText: "Enter your mail hare",
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                SizedBox(height: 20.h,),
                const Text("Password:"),
                AppTextFormFeild(
                  controller: passwordController,
                  hintText: "Enter your password hare",
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  prefixIcon: const Icon(Icons.lock_outlined),
                  suffixIcon: IconButton(
                      onPressed: (){
                        //Later
                      },
                      icon: const Icon(Icons.visibility_outlined)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: false,
                            onChanged: (value){
                              //Later
                            }
                        ),
                        const Text("Remember Me")
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                        onTap: (){
                          //Later update
                          Get.snackbar("Forget password", "Action Perform");
                        },
                        child: const Text("Forget password?")
                    )
                  ],
                ),
                SizedBox(height: 20.h,),
                AppButton(
                    title: "Login",
                    onTap: (){
                      //Later
                    }
                ),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have any account?"),
                    SizedBox(width: 2.w,),
                    InkWell(
                        onTap: (){
                          //Later update
                          Get.snackbar("SignUp", "Action Perform");
                        },
                        child: const Text("SignUp"))
                  ],
                ),
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