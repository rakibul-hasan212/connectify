
import 'dart:ui';

class UserModel{
  final String username;
  final String email;
  final String uid;
  final String bio;
  final String image;
  UserModel({
    required this.email,
    required this.username,
    required this.uid,
    required this.bio,
    required this.image
  });

  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(
        email: map['email'] ?? ' ',
        username: map['username'] ?? ' ',
        uid: map['uid'] ?? ' ',
        bio: map['bio'] ?? '',
        image:  map['image'] ?? ''
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'email': email,
      'username': username,
      'uid': uid,
      'bio': bio,
      'image': image
    };
  }


}