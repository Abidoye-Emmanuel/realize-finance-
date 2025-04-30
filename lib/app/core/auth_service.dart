import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth =  FirebaseAuth.instance;

  //email/pass signup
  Future<User?> signUp(String email, String password) async {
    try {
      final _userCrendetial = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim()
        );
      // return UserCredential.user;
    } on FirebaseAuthException catch (e) {
       throw _getErrorMessage(e.code);
    }
  }

  String _getErrorMessage (String code) {
    switch (code) {
      case '': return "";

      default: return "SignUp failed. Try again";
    }
  }





}
