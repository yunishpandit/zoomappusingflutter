import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom/resources/authmethods.dart';
import 'package:zoom/resources/jitti_metting_method.dart';
import 'package:zoom/utiles/colors.dart';
import 'package:zoom/widgets/metting_option.dart';

class Videocallscreen extends StatefulWidget {
  const Videocallscreen({Key? key}) : super(key: key);

  @override
  State<Videocallscreen> createState() => _VideocallscreenState();
}

class _VideocallscreenState extends State<Videocallscreen> {
  final Authmethod authmethod=Authmethod();
  late TextEditingController controller ;
    late TextEditingController namecontroller ;
    bool isaudomuted=true;
    bool isvideomuted=true;
   final JitisMetting jitisMetting=JitisMetting();
  @override
  void initState() {
   controller=TextEditingController();
   namecontroller=TextEditingController(text: authmethod.user.displayName);
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    namecontroller.dispose();
    JitsiMeet.removeAllListeners();
  }
  joinmetting(){
    jitisMetting.createametting(roomname:  controller.text,isaudioMuted:  isaudomuted,isvideomuted:  isvideomuted,username: namecontroller.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text(
          "Join a metting",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: controller,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                hintText: "Room id",
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
              ),
            ),
          ),
           SizedBox(
            height: 60,
            child: TextField(
              controller: namecontroller,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                hintText: "Name",
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
           InkWell(
            onTap: joinmetting,
            child: const Padding(padding: EdgeInsets.all(8),
            child: Text("Join",style: TextStyle(fontSize: 16),),
            ),
          ),
          const SizedBox(height: 20,),
           MettingOption(text: "Don't join a audio", onChanged: onaudomuted, ismute: isaudomuted,),
           MettingOption(text: "Turn Off My Video", onChanged: onvideomuted, ismute: isvideomuted,)
        ],
      ),
    );
  }
  onaudomuted(bool?val){
    setState(() {
      isaudomuted=val!;
    });
  }
  onvideomuted(bool?val){
    setState(() {
      isvideomuted=val!;
    });
  }
}
