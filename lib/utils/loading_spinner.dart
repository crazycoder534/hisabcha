import 'package:flutter/material.dart';
import 'package:hisabcha/utils/constants.dart';

class LoadingSpinner extends StatelessWidget {
  final Widget child;
  final bool loading;
  final bool linear;
  const LoadingSpinner(
      {super.key,
      this.loading = false,
      this.linear = false,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        loading
            ? Container(
                alignment: linear ? Alignment.topCenter : Alignment.center,
                color: Colors.black12,
                height: double.maxFinite,
                width: double.maxFinite,
                child: linear
                    ? LinearProgressIndicator(backgroundColor: lightPurple)
                    : CircularProgressIndicator(backgroundColor: lightPurple),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
