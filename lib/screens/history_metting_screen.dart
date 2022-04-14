import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom/resources/firebase_methods.dart';

class HistoryMettingScreen extends StatelessWidget {
  const HistoryMettingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseMethods methods=FirebaseMethods();
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: methods.mettinghistory,
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
  return const Center(child: CircularProgressIndicator(),);
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: ((context, index) {
          return ListTile(
              title: Text("Room name:${snapshot.data!.docs[index]["mettingname"]}"),
              subtitle: Text("Joined on:${DateFormat.yMMMd().format(snapshot.data!.docs[index]["createdAt"].toDate())}"),
          );
        }));
      },
    );
  }
}