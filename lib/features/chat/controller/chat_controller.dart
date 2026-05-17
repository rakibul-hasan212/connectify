import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/message_model.dart';

class ChatController extends GetxController {
  final TextEditingController messageController = TextEditingController();
  RxList<MessageModel> messages = <MessageModel>[].obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sendMessage(
      {required String chatId, required String receiverId}) async {
    try {
      String currentUid = _auth.currentUser!.uid;
      MessageModel message = MessageModel(
        senderId: currentUid,
        receiverId: receiverId,
        message: messageController.text.trim(),
        createdAt: DateTime.now(),
      );
      await _firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .add(message.toMap());
      messageController.clear();
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }
  }

  void listenMessages(String chatId) {
    _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy(
          'createdAt',
          descending: false,
        )
        .snapshots()
        .listen((snapshot) {
      List<MessageModel> temp = [];

      for (var doc in snapshot.docs) {
        temp.add(
          MessageModel.fromMap(doc.data()),
        );
      }
      messages.value = temp;
    });
  }
}
