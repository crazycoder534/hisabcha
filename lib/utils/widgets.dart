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
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? initialValue;
  HTextField({
    this.hintText,
    this.onSaved,
    this.enabled = true,
    Key? key,
    this.value,
    this.keyboardType,
    this.validator,
    this.initialValue,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      keyboardType: keyboardType,
      style: const TextStyle(color: purple),
      enabled: enabled,
      onSaved: onSaved,
      validator: validator,
      textAlignVertical: enabled ? null : TextAlignVertical.center,
      decoration: InputDecoration(
        labelText: value ?? hintText,
        labelStyle: const TextStyle(color: purple),
        suffixIcon: enabled
            ? null
            : const Icon(Icons.arrow_drop_down_circle_outlined, color: purple),
        hintStyle: TextStyle(color: lightPurple),
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        disabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        errorBorder: outlineInputBorder,
        focusedErrorBorder: outlineInputBorder,
        filled: true,
        fillColor: const Color.fromARGB(255, 251, 246, 253),
      ),
    );
  }
}

Widget header(String title) {
  return Text(title,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold));
}

toaster(BuildContext context, String msg, [Color? backgroundColor]) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg, textAlign: TextAlign.center),
      backgroundColor: backgroundColor));
}
