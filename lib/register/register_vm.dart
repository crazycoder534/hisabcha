// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:hisabcha/auth/auth.dart';
import 'package:hisabcha/utils/h_router.dart';
import 'package:stacked/stacked.dart';

import '../login/login_vu.dart';
import '../store/store.dart';

class RegisterViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future registerUser(BuildContext context) async {
    setBusy(true);
    bool success = await Authentication.registerUser(
        context, emailController.text.trim(), passwordController.text.trim());
    if (success) {
      Store.instance.initReference();
      HRouter.pushReplacement(context, const LoginScreen());
    }
    setBusy(false);
  }
}
