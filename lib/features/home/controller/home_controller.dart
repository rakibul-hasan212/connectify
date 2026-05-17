import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../auth/model/user_model.dart';

class UserController extends GetxController {
  RxList<UserModel?> users = <UserModel?>[].obs;
  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .snapshots()
          .listen((snapshot) {
        List<UserModel> tempUsers = [];
        for (var doc in snapshot.docs) {
          if(doc['uid'] != FirebaseAuth.instance.currentUser!.uid){
            tempUsers.add(
              UserModel.fromMap(doc.data()),
            );
          }
        }
        users.value = tempUsers;
      });
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }
  }
}
