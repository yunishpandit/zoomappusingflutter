import 'package:flutter/material.dart';
import 'package:zoom/resources/authmethods.dart';
import 'package:zoom/widgets/cosutm_buttom.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({ Key? key }) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    final Authmethod authmethod=Authmethod();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:  [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Start or Join metting",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric( vertical:40 ),
              child: Image.asset("img/onboarding.jpg"),
            ),
             Costumbuttom(text: "Google Sign In",onpreshed: ()async{
           bool res=await authmethod.siginwithgoogle(context);
           if(res){
             Navigator.pushNamed(context, '/home-screen');
           }
             },)
          ],
        ),
      ),
    );
  }
}