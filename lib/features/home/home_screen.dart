import 'package:connectify/core/routes/app_routes.dart';
import 'package:connectify/features/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget{

  HomeScreen({super.key});
  String time = DateFormat('EEE, hh:mm:ss a').format(DateTime.now());
  List activeFrnd = [
    "Sajel",
    "Rahim",
    "Rahman",
    "Badsha",
    "Korim",
    "Rokib",
    "Nazmul",
    "Sojol",
    "Shamim",
    "Robin",
    "Sajel",
    "Rahim",
    "Rahman",
    "Badsha",
    "Korim",
    "Rokib",
    "Nazmul",
    "Sojol",
    "Shamim",
    "Robin"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        toolbarHeight: 60.h,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: IconButton(
                onPressed: (){
                  //Later update
                  Get.toNamed(AppRoutes.Login);
                },
                icon: const Icon(Icons.logout)
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: activeFrnd.length,
          itemBuilder: (context, index){
            final data = activeFrnd[index];
            return InkWell(
              onTap: (){
                Get.toNamed(AppRoutes.Chat, arguments: data);
              },
              child: ListTile(
                  leading: CircleAvatar(
                    radius: 40.r,
                    child: Icon(Icons.person_outline, size: 40.h,),
                  ),
                  title: Text(data),
                  subtitle: const Text("last message"),
                  trailing: Text(time)
              ),
            );
          })
    );
  }

}