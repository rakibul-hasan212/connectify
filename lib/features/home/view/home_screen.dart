import 'package:connectify/core/routes/app_routes.dart';
import 'package:connectify/features/auth/model/user_model.dart';
import 'package:connectify/features/chat/view/chat_screen.dart';
import 'package:connectify/features/home/controller/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget{

  HomeScreen({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserController controller = Get.put(UserController());
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
        final userList = controller.users.value;
        if(userList == null){
          return Center(child: CircularProgressIndicator(),);
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index){
                      final data = userList[index];
                      return InkWell(
                        onTap: (){
                          Get.toNamed(AppRoutes.Chat, arguments: data);
                        },
                        child: ListTile(
                            leading: CircleAvatar(
                              radius: 40.r,
                              child: Icon(Icons.person_outline, size: 40.h,),
                            ),
                            title: Text(data!.username),
                            subtitle: Text(data.email),
                            trailing: Text(time)
                        ),
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



