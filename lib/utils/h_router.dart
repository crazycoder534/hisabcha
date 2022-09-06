import 'package:flutter/cupertino.dart';

class HRouter {
  static push(BuildContext context, Widget destination) {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => destination));
  }

  static pushReplacement(BuildContext context, Widget destination) {
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => destination));
  }
}
