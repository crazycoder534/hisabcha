import 'package:flutter/material.dart';
import 'package:hisabcha/utils/constants.dart';
import 'package:hisabcha/utils/widgets.dart';
import 'package:stacked/stacked.dart';

import '../utils/loading_spinner.dart';
import 'register_vm.dart';

class RegisterScreen extends ViewModelBuilderWidget<RegisterViewModel> {
  const RegisterScreen({super.key});

  @override
  Widget builder(
      BuildContext context, RegisterViewModel viewModel, Widget? child) {
    return LoadingSpinner(
      loading: viewModel.isBusy,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HTextField(
                  hintText: 'Email', controller: viewModel.emailController),
              bigSpace,
              HTextField(
                  hintText: 'Password',
                  controller: viewModel.passwordController),
              space,
              GestureDetector(
                onTap: () => viewModel.registerUser(context),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      color: purple, borderRadius: BorderRadius.circular(8)),
                  child: const Text('Join',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  RegisterViewModel viewModelBuilder(BuildContext context) {
    return RegisterViewModel();
  }
}
