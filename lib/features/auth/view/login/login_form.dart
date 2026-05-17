
import 'package:connectify/core/Utils/validation/validation.dart';
import 'package:connectify/core/routes/app_routes.dart';
import 'package:connectify/core/widgets/button/app_button.dart';
import 'package:connectify/core/widgets/textFormFeild/app_text_form_feild.dart';
import 'package:connectify/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget{
  final AuthController controller = Get.put(AuthController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Email"),
            AppTextFormFeild(
              controller: emailController,
              hintText: "Enter your mail hare",
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email_outlined),
              validator: AppValidations.email,
            ),
            SizedBox(height: 20.h,),
            const Text("Password:"),
            Obx( () {
              return AppTextFormFeild(
                  controller: passwordController,
                  hintText: "Enter your password hare",
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: controller.isPasswordHidden.value,
                  prefixIcon: const Icon(Icons.lock_outlined),
                  suffixIcon: IconButton(
                      onPressed: (){
                        controller.togglePassword();
                      },
                      icon:  Icon(
                          controller.isPasswordHidden.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined
                      )
                  ),
                  validator: AppValidations.password
              );
            }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Obx(() {
                        return Checkbox(
                            value: controller.isChecked.value,
                            onChanged: (value){
                              controller.Checked();
                            }
                        );
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
            Obx(() {
                return AppButton(
                    child: controller.isLoading.value
                        ? const Center(child: CircularProgressIndicator(),)
                        : const Text("Login"),
                    onTap: () async{
                      if(formKey.currentState!.validate()){
                        await controller.login(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim()
                        );
                      }
                    }
                );
              }
            ),
          ],
        )
    );
  }

}