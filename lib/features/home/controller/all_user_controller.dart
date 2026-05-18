import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectify/core/Utils/chat/chat_utils.dart';
import 'package:connectify/features/chat/model/chat_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../auth/model/user_model.dart';

class UserController extends GetxController {
  // all users list
  RxList<UserModel> users = <UserModel>[].obs;

  // filterUsers List
  RxList<UserModel> filteredUsers = <UserModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    listenUsers();
  }
  // Realtime Users Listen
  void listenUsers() {
    try {
      String currentUid = FirebaseAuth.instance.currentUser!.uid;
      isLoading.value = true;
      FirebaseFirestore.instance
          .collection('users')
          .snapshots()
          .listen((snapshot) {
        List<UserModel> tempUsers = [];
        for (var doc in snapshot.docs) {
          UserModel user = UserModel.fromMap(doc.data());
          // show without the current user
          if (user.uid != currentUid) {
            tempUsers.add(user);
          }
        }
        // update the users list
        users.value = tempUsers;
        //initialize the filteredUsers
        filteredUsers.value = tempUsers;
        isLoading.value = false;
      });
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }
  }

  // Search the users
  void searchUsers(String query) {
    if (query.trim().isEmpty) {
      filteredUsers.value = users.toList();
    } else {
      filteredUsers.value = users.where((user) {
        return user.username.toLowerCase().contains(
              query.toLowerCase(),
            );
      }).toList();
    }
  }
  Future<ChatRoomModel?> getChatRoom(String receiverUid,) async {
    String currentUid = FirebaseAuth.instance.currentUser!.uid;

    String chatId = ChatUtils.generateChatId(currentUid, receiverUid);

    final doc = await FirebaseFirestore.instance
        .collection('chats')
        .doc(chatId)
        .get();

    if(doc.exists) {
      ChatRoomModel room = ChatRoomModel.fromMap(
        doc.data()!,
      );
      return room;
    }
    return null;
  }
}
