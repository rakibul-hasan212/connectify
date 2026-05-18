import 'package:connectify/core/Utils/dateFormat/date_format_utils.dart';
import 'package:connectify/core/routes/app_routes.dart';
import 'package:connectify/features/home/controller/chat_list_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget{

  HomeScreen({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ChatListController chatListController = Get.put(ChatListController());
  String time = DateFormat('EEE, hh:mm:ss a').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Connectify"),
        toolbarHeight: 60.h,
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: IconButton(
                onPressed: () async{
                  await _auth.signOut();
                  Get.toNamed(AppRoutes.Login);
                },
                icon: const Icon(Icons.logout)
            ),
          )
        ],
      ),
      body: Obx((){
        final chatList = chatListController.chats.value;
        if(chatList.isEmpty){
          return const Center(child: Text("No Chats Yet"));
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: chatList.length,
                    itemBuilder: (context, index){
                      final data = chatList[index];
                      return FutureBuilder(
                        future: chatListController.getReceiverData(
                          data.participants,
                        ),
                        builder: (context, snapshot) {
                          if(!snapshot.hasData) {
                            return const SizedBox();
                          }
                          final user = snapshot.data!;
                          return ListTile(
                            onTap: (){
                              Get.toNamed(
                                  AppRoutes.Chat,
                                  arguments: user
                              );
                            },
                            leading: CircleAvatar(
                              child: Text( user.image.isEmpty ? user.username[0] : "U"),
                            ),
                            title: Text(user.username),
                            subtitle: Text(data.lastMessage),
                            trailing: Text(
                                DateFormatter.formatChatListTime(
                              data.lastMessageTime
                            )),
                          );
                        },
                      );
                    })
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },

        child: const Icon(Icons.chat),
      ),
    );
  }

}



