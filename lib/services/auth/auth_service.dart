import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  //signIN

  Future<UserCredential> signInWithEmailAndPassword(
      String emal, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: emal, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //signUp
  Future<UserCredential> signUpWithEmailAndPassword(
      String emal, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: emal, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  String getEmail() {
    User? currentUser = getCurrentUser();
    if (currentUser != null) {
      return currentUser.email ?? '';
    }
    return '';
  }
}
