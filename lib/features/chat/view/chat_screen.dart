import 'package:connectify/features/auth/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/Utils/chat/chat_utils.dart';
import '../controller/chat_controller.dart';

class ChatScreen extends StatefulWidget{

  ChatScreen({super.key,});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatController chatController = Get.put(ChatController());
  late final UserModel receiver = Get.arguments;
  late final String chatId;

  @override
  void initState() {
    super.initState();
    final String currentUid = FirebaseAuth.instance.currentUser!.uid;
    chatId = ChatUtils.generateChatId(currentUid, receiver.uid,);
    chatController.listenMessages(chatId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 25.h,
            child: const Icon(Icons.person_outline),
          ),
        ),
        title: Text(receiver.username),
        toolbarHeight: 60.h,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  final message = chatController.messages[index];
                  return ListTile(
                    title: Text(message.message),
                  );
                },
              );
            }),
          ),
        ],
      ),
      bottomSheet: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        height: 80.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(16.r)
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: chatController.messageController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 16.h),
                      hintText: "Type your message....",
                  ),
                ),
              ),
              IconButton(
                  onPressed: (){
                    chatController.sendMessage(
                        chatId: chatId,
                        receiverId: receiver.uid
                    );
                    Get.snackbar("Send", "Send Button action perform");
                  }, icon: Icon(Icons.send_outlined))
            ],
          ),
        ),
      ),

    );
  }
}