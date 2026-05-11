
import 'package:connectify/core/routes/app_routes.dart';
import 'package:connectify/core/widgets/button/app_button.dart';
import 'package:connectify/core/widgets/textFormFeild/app_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget{
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40.w),
          height: 700.h,
          width: double.maxFinite,
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
                    radius: 40.h,
                    child: Icon(Icons.account_circle_outlined, size: 40.h, color: Colors.orange,),
                  ),
                ),
                SizedBox(height: 10.h,),
                const Center(child: Text("Create an Account!")),
                SizedBox(height: 30.h,),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("User Name: "),
                      AppTextFormFeild(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "Enter your email here",
                        prefixIcon: const Icon(Icons.email_outlined),
                      ),
                      SizedBox(height: 20.h,),
                      const Text("Email: "),
                      AppTextFormFeild(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: "Enter your email here",
                          prefixIcon: const Icon(Icons.email_outlined),
                      ),
                      SizedBox(height: 20.h,),
                      const Text("Password: "),
                      AppTextFormFeild(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          hintText: "Enter your password here",
                          obscureText: true,
                          prefixIcon: const Icon(Icons.lock_outlined),
                          suffixIcon: IconButton(
                              onPressed: (){
                                //Later update
                              },
                              icon: const Icon(Icons.visibility)
                          ),
                      ),
                      SizedBox(height: 20.h,),
                      const Text("Confirm Password: "),
                      AppTextFormFeild(
                        controller: confirmPassController,
                        keyboardType: TextInputType.visiblePassword,
                        hintText: "Enter your password here",
                        obscureText: true,
                        prefixIcon: const Icon(Icons.confirmation_num_outlined),
                        suffixIcon: IconButton(
                            onPressed: (){
                              //Later update
                            },
                            icon: const Icon(Icons.visibility)
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      AppButton(
                          title: "Signup",
                          onTap: (){
                            //Later update
                            Get.toNamed(AppRoutes.Login);
                          }
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}