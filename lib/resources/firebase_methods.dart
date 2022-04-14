import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseMethods{
  final FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  final FirebaseAuth auth=FirebaseAuth.instance;
  Stream<QuerySnapshot<Map<String, dynamic>>> get mettinghistory=> firebaseFirestore.collection("users").doc(auth.currentUser!.uid).collection("mettings").snapshots();
  void addtomettinghistory(String roomname)async{
try{
 await firebaseFirestore.collection("users").doc(auth.currentUser!.uid).collection("mettings").add({
"mettingname":roomname,
"createdAt":DateTime.now()
 });
}catch(e){

}
  }
}