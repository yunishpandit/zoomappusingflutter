import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom/resources/jitti_metting_method.dart';
import 'package:zoom/widgets/home_meetings_buttom.dart';

class Mettingscrenn extends StatefulWidget {
  const Mettingscrenn({Key? key}) : super(key: key);

  @override
  State<Mettingscrenn> createState() => _MettingscrennState();
}

class _MettingscrennState extends State<Mettingscrenn> {
  final JitisMetting _jitisMetting=JitisMetting();
  createnewmetting()async{
    var random=Random();
    String roomname=(random.nextInt(10000000)+10000000).toString();
_jitisMetting.createametting(isaudioMuted: true,isvideomuted: true, roomname: roomname);
  }
  joinmetting(){
    
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMettingbuttom(onpressed: createnewmetting,
              text: "New Metting",
              icon: Icons.videocam,
              ),
               HomeMettingbuttom(onpressed: (){
                 Navigator.pushNamed(context,'/video-call');
               },
              text: "Join Metting",
              icon: Icons.add_box_rounded,
              ),
               HomeMettingbuttom(onpressed: (){},
              text: "Schedule",
              icon: Icons.calendar_today,
              ),
               HomeMettingbuttom(onpressed: (){},
              text: "Share Screen",
              icon: Icons.arrow_upward_outlined,
              )
            ],
          ),
          const Expanded(child: Center(
            child: Text("Create/Join Metting with just a click!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          ))
        ],
      );
  }
}