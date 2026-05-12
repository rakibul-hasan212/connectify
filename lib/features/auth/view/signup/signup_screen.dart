
import 'package:connectify/core/Utils/app_scrollable.dart';
import 'package:connectify/features/auth/view/signup/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppScrollable(
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40.w),
              constraints: BoxConstraints(
                minHeight: 700.h,
              ),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.orangeAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20.r)
              ),
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                    SizedBox(height: 20.h,),
                    SignupForm()
                  ],
                ),
              ),
            ),
          ),
      )
    );
  }
}