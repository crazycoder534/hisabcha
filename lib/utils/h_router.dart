import 'package:flutter/cupertino.dart';

class HRouter {
  static Future push(BuildContext context, Widget destination) {
    return Navigator.push(
        context, CupertinoPageRoute(builder: (context) => destination));
  }

  static pushReplacement(BuildContext context, Widget destination) {
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => destination));
  }
}
