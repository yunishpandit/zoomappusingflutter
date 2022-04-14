import 'package:flutter/material.dart';
import 'package:zoom/utiles/colors.dart';

class MettingOption extends StatelessWidget {
  final String text;
  final bool ismute;
  final Function(bool) onChanged;
  const MettingOption({ Key? key, required this.text, required this.ismute, required this.onChanged }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:60,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text,style: const TextStyle(fontSize: 16),),
          ),
          Switch.adaptive(value: ismute, onChanged: onChanged)
        ],
      ),
    );
  }
}