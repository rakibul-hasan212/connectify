import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signup(
      {required String email, required String password}) async {
    return await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> login(
      {required String email, required String password}) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }
}
