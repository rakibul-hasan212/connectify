
import 'package:get/get.dart';

class AuthController extends GetxController{

  final RxBool  isPasswordHidden = true.obs;
  final RxBool isChecked = false.obs;
  final RxBool isConfirmHidden = true.obs;

  void togglePassword(){
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void Checked(){
    isChecked.value = !isChecked.value;
  }

  void isConfirmToggle(){
    isConfirmHidden.value = !isConfirmHidden.value;
  }


}