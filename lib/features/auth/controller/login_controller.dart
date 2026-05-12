
import 'package:get/get.dart';

class LoginController extends GetxController{

  final RxBool  isPasswordHidden = true.obs;
  final RxBool isChecked = false.obs;

  void togglePassword(){
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void Checked(){
    isChecked.value = !isChecked.value;
  }


}