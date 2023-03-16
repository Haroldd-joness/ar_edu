

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  Future<String?> signup({
    required String username,
    required String password,
    
}) async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: username,
          password: password
      );
      return 'Success';
    }
    on FirebaseAuthException catch (e){

    }
  }
}