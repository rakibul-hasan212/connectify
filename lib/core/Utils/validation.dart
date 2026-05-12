
import 'package:get/get.dart';

class AppValidations{
  static String? password(String? value){
    if(value!.isEmpty || value==null){
      return "Password required!";
    }
    if( value.length < 6 ){
      return "Password should be At least 6 digit";
    }
    return null;
  }

  static String? email(String? value){
    if(value == null || value.isEmpty){
      return "Email required!";
    }
    if(!GetUtils.isEmail(value)){
      return "Please give your actual formatted email";
    }
    return null;
  }

  static String? confirmPassword(String? value, String password){
    if(value == null || value.isEmpty){
      return "Confirm Password required!";
    }
    if(value != password){
      return "Re-write the password";
    }
    return null;
  }
}