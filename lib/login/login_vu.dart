import 'package:flutter/material.dart';
import 'package:hisabcha/utils/constants.dart';
import 'package:hisabcha/utils/widgets.dart';
import 'login_vm.dart';
import 'package:stacked/stacked.dart';

class LoginScreen extends ViewModelBuilderWidget<LoginViewModel> {
  const LoginScreen({super.key});

  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png'),
              const Text('Login',
                  style: TextStyle(
                      color: purple,
                      fontSize: 48,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              const Text('Prove your identity',
                  style: TextStyle(
                      color: green, fontSize: 20, fontWeight: FontWeight.w600)),
              const SizedBox(height: 24),
              HTextField(
                hintText: 'Enter Your Name',
                controller: viewModel.controller,
              ),
              bigSpace,
              GestureDetector(
                onTap: () => viewModel.authenticate(context),
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  decoration: BoxDecoration(
                    color: purple,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) {
    return LoginViewModel();
  }
}
