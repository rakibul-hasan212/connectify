import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectify/features/chat/model/chat_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../auth/model/user_model.dart';

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

  Future<UserModel?> getReceiverData(
      List participants,
      ) async {
    String currentUid =
        FirebaseAuth.instance.currentUser!.uid;

    String receiverUid = participants.firstWhere(
          (uid) => uid != currentUid,
    );

    final doc = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(receiverUid)
        .get();

    if(doc.data() != null) {
      return UserModel.fromMap(
        doc.data()!,
      );
    }
    return null;
  }
}
