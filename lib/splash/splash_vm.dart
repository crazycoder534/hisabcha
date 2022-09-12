import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hisabcha/presistance.dart';
import 'package:hisabcha/utils/h_router.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  Timer gotoHome(BuildContext context) => Timer(const Duration(seconds: 3),
      () => HRouter.pushReplacement(context, const Presistance()));
}
