import 'package:flutter/material.dart';
import 'package:hisabcha/splash/splash_vm.dart';
import 'package:hisabcha/utils/constants.dart';
import 'package:stacked/stacked.dart';

class SplashScreen extends ViewModelBuilderWidget<SplashViewModel> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, SplashViewModel viewModel, Widget? child) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: lightPurple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.1),
          const Spacer(),
          Image.asset('assets/logo.png'),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: LinearProgressIndicator(
                color: purple, backgroundColor: lightRed),
          ),
          SizedBox(height: size.height * 0.3),
        ],
      ),
    );
  }

  @override
  SplashViewModel viewModelBuilder(BuildContext context) {
    SplashViewModel vm = SplashViewModel();
    vm.gotoHome(context);
    return vm;
  }
}
