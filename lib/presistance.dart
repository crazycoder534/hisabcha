import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hisabcha/auth/auth.dart';
import 'package:hisabcha/login/login_vu.dart';

import 'register/register_vu.dart';

class Presistance extends StatelessWidget {
  const Presistance({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Authentication.instance.auth.authStateChanges(),
      builder: (context, snapshot) =>
          snapshot.hasData ? const LoginScreen() : const RegisterScreen(),
    );
  }
}
