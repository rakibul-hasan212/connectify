
import 'package:connectify/core/widgets/button/app_button.dart';
import 'package:connectify/core/widgets/textFormFeild/app_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            Text("Email"),
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
          ],
        )
    );
  }

}