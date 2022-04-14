import 'package:flutter/material.dart';
import 'package:zoom/utiles/colors.dart';

class Costumbuttom extends StatelessWidget {
  final String text;
  final VoidCallback onpreshed;
  const Costumbuttom({Key? key, required this.text, required this.onpreshed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
        child: Text(text,style: const TextStyle(fontSize: 17),) ,
         onPressed: onpreshed,
         style: ElevatedButton.styleFrom(
           primary: buttonColor,
           minimumSize: const Size(double.infinity, 50),
           shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
           side: const BorderSide(color: buttonColor)
         ),
      ),
    );
  }
}