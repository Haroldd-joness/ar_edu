import 'package:firebase_auth/firebase_auth.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<String?> createAccount(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      User? user = userCredential.user;
      if (user != null) {
        ///account created successfully
        return 'Account created successfully';
      } else {
        ///something went wrong
        return 'Failed to create account';
      }
    } on FirebaseAuthException catch (e) {
      ///catch and handle error that may occur during the process
      if (e.code == 'weak-password') {
        return 'The password provided is too weak';
      }
      else if (e.code == 'email-already-in-use') {
        return 'The account already exist for that email';
      }
      else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

}