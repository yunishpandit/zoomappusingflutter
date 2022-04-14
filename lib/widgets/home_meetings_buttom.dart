import 'package:flutter/material.dart';
import 'package:zoom/utiles/colors.dart';

class HomeMettingbuttom extends StatelessWidget {
  final VoidCallback onpressed;
  final IconData icon;
  final String text;
  const HomeMettingbuttom({Key? key, required this.onpressed, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Column(
        children: [
          Container(
       decoration: BoxDecoration(
         color: buttonColor,
         borderRadius: BorderRadius.circular(15),
         boxShadow:  [
           BoxShadow(
             blurRadius: 10,
             color: Colors.black.withOpacity(0.06),
             offset: const Offset(0,4)
           )
         ]
       ),
       height: 60,
       width: 60,
       child: Icon(icon,size: 30,color: Colors.white,),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(text,style: const TextStyle(color: Colors.grey),)
        ],
      ),
    );
  }
}