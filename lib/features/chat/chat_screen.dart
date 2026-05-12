import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget{
  final user = Get.arguments;
  ChatScreen({super.key,});
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
        title: Text(user),
        toolbarHeight: 60.h,
      ),
      body: Column(

      ),
      bottomSheet: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        height: 80.h,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(16.r)
        ),
        child: Center(
          child: TextFormField(
            controller: TextEditingController(),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 16.h),
              hintText: "Type your message....",
              prefixIcon: IconButton(
                  onPressed: (){
                    //Later Update
                  },
                  icon: Icon(Icons.ac_unit)),
              suffixIcon: IconButton(
                  onPressed: (){
                    Get.snackbar("Send", "Send Button action perform");
                  }, icon: Icon(Icons.send_outlined))
            ),
          ),
        ),
      ),

    );
  }

}