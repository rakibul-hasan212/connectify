import 'package:connectify/core/routes/app_routes.dart';
import 'package:connectify/features/auth/repository/auth_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepository _repository = AuthRepository();

  final RxBool isPasswordHidden = true.obs;
  final RxBool isChecked = false.obs;
  final RxBool isConfirmHidden = true.obs;
  final RxBool isLoading = false.obs;

  void togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void Checked() {
    isChecked.value = !isChecked.value;
  }

  void isConfirmToggle() {
    isConfirmHidden.value = !isConfirmHidden.value;
  }
  //signup method
  Future<void> signup({required String email, required String password}) async {
    try {
      isLoading.value = true;
      await _repository.signup(email: email, password: password);
      Get.snackbar("Signup", "Account create Successfully");
      Get.toNamed(AppRoutes.Login);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //login method
  Future<void> login({required String email, required String password}) async{
    try{
      isLoading.value = true;
      await _repository.login(email: email, password: password);
      Get.snackbar("Login", "Login Successful");
      Get.toNamed(AppRoutes.Home);
    }catch(e){
      Get.snackbar("Error", e.toString());
    }finally{
      isLoading.value = false;
    }
  }


}
