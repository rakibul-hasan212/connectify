
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget{
  final Widget child;
  final VoidCallback onTap;
  const AppButton({
    super.key,
    required this.child,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55.h,
      child: ElevatedButton( 
          onPressed: onTap,  
          child: child
      ),
    );
  }
  
  
}