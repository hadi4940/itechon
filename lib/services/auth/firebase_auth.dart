import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ------------ Signup User/un-comment if needed -------------//
  /*
  Future<String> signUpUser({
    required String userName,
    required String email,
    required String password,
    required String phoneNo,
   
  }) async {
    String res = "Some error occur";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          phoneNo.isNotEmpty ||
          userName.isNotEmpty) {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        
        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
*/
  // ------------Login User--------------//
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occur";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  // ------------Sign out------------- //
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
