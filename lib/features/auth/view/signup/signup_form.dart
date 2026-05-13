import 'package:connectify/core/Utils/validation.dart';
import 'package:connectify/core/routes/app_routes.dart';
import 'package:connectify/core/widgets/button/app_button.dart';
import 'package:connectify/core/widgets/textFormFeild/app_text_form_feild.dart';
import 'package:connectify/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupForm extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("User Name: "),
          AppTextFormFeild(
            controller: usernameController,
            keyboardType: TextInputType.text,
            hintText: "Enter your username here",
            prefixIcon: const Icon(Icons.person_outline),
          ),
          SizedBox(
            height: 16.h,
          ),
          const Text("Email: "),
          AppTextFormFeild(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: "Enter your email here",
            prefixIcon: const Icon(Icons.email_outlined),
            validator: AppValidations.email,
          ),
          SizedBox(
            height: 16.h,
          ),
          const Text("Password: "),
          Obx(() {
            return AppTextFormFeild(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              hintText: "Enter your password here",
              obscureText: controller.isPasswordHidden.value,
              prefixIcon: const Icon(Icons.lock_outlined),
              suffixIcon: IconButton(
                  onPressed: () {
                    //Later update
                    controller.togglePassword();
                  },
                  icon: Icon(controller.isPasswordHidden.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined)),
              validator: AppValidations.password,
            );
          }),
          SizedBox(
            height: 16.h,
          ),
          const Text("Confirm Password: "),
          Obx(() {
            return AppTextFormFeild(
              controller: confirmPassController,
              keyboardType: TextInputType.visiblePassword,
              hintText: "Enter your password here again",
              obscureText: controller.isConfirmHidden.value,
              prefixIcon: const Icon(Icons.confirmation_num_outlined),
              suffixIcon: IconButton(
                  onPressed: () {
                    //Later update
                    controller.isConfirmToggle();
                  },
                  icon: Icon(controller.isConfirmHidden.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined)),
              validator: (value) {
                return AppValidations.confirmPassword(
                    value, passwordController.text);
              },
            );
          }),
          SizedBox(
            height: 16.h,
          ),
          Obx(() {
            return AppButton(
                child: controller.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Text("Signup"),
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    await controller.signup(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim());
                    Get.toNamed(AppRoutes.Login);
                  }
                });
          })
        ],
      ),
    );
  }
}
