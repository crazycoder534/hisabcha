import 'package:flutter/material.dart';

import 'constants.dart';

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

class HTextField extends StatelessWidget {
  final String? hintText;
  void Function(String?)? onSaved;
  final bool enabled;
  final String? value;
  final TextInputType? keyboardType;
  HTextField({
    this.hintText,
    this.onSaved,
    this.enabled = true,
    Key? key,
    this.value,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: lightPurple!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        style: enabled ? null : const TextStyle(color: purple),
        enabled: enabled,
        onSaved: onSaved,
        textAlignVertical: enabled ? null : TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: value ?? hintText,
          suffixIcon: enabled
              ? null
              : const Icon(Icons.arrow_drop_down_circle_outlined,
                  color: purple),
          hintStyle: TextStyle(color: lightPurple),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

Widget header(String title) {
  return Text(title,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold));
}
