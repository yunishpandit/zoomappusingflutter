import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom/utiles/utiles.dart';

class Authmethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Stream<User?> get authchanges=> _auth.authStateChanges();
  User get user=>_auth.currentUser!;
 Future<bool> siginwithgoogle(BuildContext context) async {
   bool res=false;
    try {
      final GoogleSignInAccount? gooleuser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleauth =
          await gooleuser!.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleauth.accessToken, idToken: googleauth.idToken);
      UserCredential usercredential =
          await _auth.signInWithCredential(credential);
      User? user = usercredential.user;
      if (user != null) {
        if (usercredential.additionalUserInfo!.isNewUser) {
          await firebaseFirestore.collection("users").doc(user.uid).set({
            "username": user.displayName,
            "uid": user.uid,
            "photourl": user.photoURL
          });
        }
        res=true;
      }
     
    } on FirebaseAuthException catch (e) {
      showsnakbar(context, e.message!);
      res=false;
    }
    return res;
  }
  void signOut()async{
   try {
     await _auth.signOut();
   } on Exception catch (e) {
     print(e);
   }
  }
}
