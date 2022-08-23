import 'package:flutter/material.dart';

Future mover(BuildContext context, Widget destination) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => destination));
}

Widget iconButton(
    {VoidCallback? onTap,
    required String lable,
    Color? color,
    Color? lableColor}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(lable, style: TextStyle(color: lableColor, fontSize: 16)),
      ),
    ),
  );
}

// Widget 
