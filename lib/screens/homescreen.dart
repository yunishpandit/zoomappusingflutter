import 'package:flutter/material.dart';
import 'package:zoom/screens/history_metting_screen.dart';
import 'package:zoom/screens/mettings_screen.dart';
import 'package:zoom/screens/settings_page.dart';
import 'package:zoom/utiles/colors.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
   int _page=0;
  onpagechanged(int page){
    setState(() {
      _page=page;
    });
  }
  List<Widget> pages=[
    const Mettingscrenn(),
    const HistoryMettingScreen(),
    
    const Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Meet & Chat"),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onpagechanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.comment_bank),label: "Meet and chat"),
         BottomNavigationBarItem(icon: Icon(Icons.lock_clock),label: "Metting"),
         
             BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),label: "Settings")
      ]),
    );
  }
}