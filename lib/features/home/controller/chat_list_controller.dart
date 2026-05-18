import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectify/features/chat/model/chat_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ChatListController extends GetxController {
  RxList<ChatRoomModel> chats = <ChatRoomModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    listenChats();
  }

  void listenChats() {
    String currentUid = FirebaseAuth.instance.currentUser!.uid;

    FirebaseFirestore.instance
        .collection('chats')
        .where(
          'participants',
          arrayContains: currentUid,
        )
        .orderBy(
          'lastMessageTime',
          descending: true,
        )
        .snapshots()
        .listen((snapshot) {
      List<ChatRoomModel> temp = [];
      for (var doc in snapshot.docs) {
        temp.add(
          ChatRoomModel.fromMap(
            doc.data(),
          ),
        );
      }
      chats.value = temp;
    });
  }
}
