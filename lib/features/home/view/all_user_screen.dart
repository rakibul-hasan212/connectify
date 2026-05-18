import 'package:connectify/core/Utils/dateFormat/date_format_utils.dart';
import 'package:connectify/features/home/controller/all_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';

class AllUsersScreen extends StatelessWidget {
  AllUsersScreen({super.key});
  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Users",
        ),
      ),
      body: Column(
        children: [
          // SEARCH FIELD
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: userController.searchUsers,
              decoration: InputDecoration(
                hintText: "Search users",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // Show users
          Expanded(
            child: Obx(() {
              if (userController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (userController.filteredUsers.isEmpty) {
                return const Center(
                  child: Text(
                    "No Users Found",
                  ),
                );
              }
              return ListView.builder(
                itemCount: userController.filteredUsers.length,
                itemBuilder: (context, index) {
                  final user = userController.filteredUsers[index];
                  return FutureBuilder(
                    future: userController.getChatRoom(
                      user.uid,
                    ),
                    builder: (context, snapshot) {
                      final room = snapshot.data;
                      return ListTile(
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.Chat,
                            arguments: user,
                          );
                        },
                        leading: CircleAvatar(
                          child: Text(
                            user.username.isNotEmpty ? user.username[0] : "U",
                          ),
                        ),
                        title: Text(user.username),
                        subtitle: Text(
                          room != null ? room.lastMessage : "Start chatting",
                        ),
                        trailing: room != null
                            ? Text(
                                DateFormatter.formatChatListTime(
                                  room.lastMessageTime,
                                ),
                              )
                            : null,
                      );
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
