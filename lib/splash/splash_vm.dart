import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:hisabcha/utils/h_router.dart';
import 'package:stacked/stacked.dart';

import '../home/home_vu.dart';

class SplashViewModel extends BaseViewModel {
  Timer gotoHome(BuildContext context) => Timer(const Duration(seconds: 3),
      () => HRouter.push(context, const HomeView()));
}
