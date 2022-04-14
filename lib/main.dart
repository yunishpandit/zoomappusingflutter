import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom/resources/authmethods.dart';
import 'package:zoom/screens/homescreen.dart';
import 'package:zoom/screens/loginsereen.dart';
import 'package:zoom/screens/video_call_screen.dart';
import 'package:zoom/utiles/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor
      ),
      routes: {
        '/login':(context) => const Loginscreen(),
        '/home-screen':(context) => const Homescreen(),
        '/video-call':(context) => const Videocallscreen()
      },
home:StreamBuilder(
  stream: Authmethod().authchanges,
  builder: (context, snapshot) {
    if(snapshot.connectionState==ConnectionState.waiting){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if(snapshot.hasData){
      return const Homescreen();
    }
    return const Loginscreen();
  } ,),
    );
  }
}