import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class Authentication {
  static Authentication? _instance;
  static Authentication get instance => _instance ??= Authentication();
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiomatrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e.message);
      return false;
    }
  }

  static Future<bool> authenticateUser() async {
    final isAvailable = await hasBiomatrics();
    if (!isAvailable) return false;
    try {
      return await _auth.authenticate(
          localizedReason: 'Scan fingerprint to authenticate');
    } on PlatformException catch (e) {
      print(e.message);
      return false;
    }
  }
}
