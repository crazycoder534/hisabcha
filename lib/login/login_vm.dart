import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../auth/auth.dart';
import '../home/home_vu.dart';
import '../utils/h_router.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController controller = TextEditingController();
  Future authenticate(context) async {
    if (controller.text.trim().isNotEmpty) {
      bool success = await Authentication.authenticateUser(context);
      if (success) {
        HRouter.pushReplacement(context, HomeView(controller.text.trim()));
      }
    }
  }
}
