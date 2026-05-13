import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectify/features/auth/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signup(
      {required String email,
        required String password,
        required String username}) async {
    final credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password
    );
    UserModel user = UserModel(
        email: email,
        username: username,
        uid: credential.user!.uid,
        bio: '',
        image: '',
    );
    //user wise documents create
    await _firestore.collection("users").doc(user.uid).set(user.toMap());
  }

  Future<void> login(
      {required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }
}
