// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hisabcha/utils/widgets.dart';
import 'package:local_auth/local_auth.dart';

class Authentication {
  static Authentication? _instance;
  static Authentication get instance => _instance ??= Authentication();
  static final _localAuth = LocalAuthentication();
  final FirebaseAuth auth = FirebaseAuth.instance;
  static Future<bool> registerUser(
      BuildContext context, String email, String password) async {
    try {
      await Authentication.instance.auth
          .createUserWithEmailAndPassword(email: email, password: password);
      await Authentication.instance.auth
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        await Authentication.instance.auth
            .signInWithEmailAndPassword(email: email, password: password);
        return true;
      }
      toaster(context, e.message.toString());
      return false;
    }
  }

  static Future<bool> hasBiomatrics(BuildContext context) async {
    try {
      return await _localAuth.canCheckBiometrics;
    } on PlatformException catch (e) {
      toaster(context, e.message.toString());
      return false;
    }
  }

  static Future<bool> authenticateUser(BuildContext context) async {
    final isAvailable = await hasBiomatrics(context);
    if (!isAvailable) {
      toaster(context, 'Biometrics feature not available in this device');
      return false;
    }
    try {
      return await _localAuth.authenticate(
          localizedReason: 'Scan fingerprint to authenticate');
    } on PlatformException catch (e) {
      toaster(context, e.message.toString());
      return false;
    }
  }
}
