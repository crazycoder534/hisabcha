import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hisabcha/splash/splash_vu.dart';
import 'package:hisabcha/utils/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Hisabcha());
}

class Hisabcha extends StatelessWidget {
  const Hisabcha({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: purple),
      home: const SplashScreen(),
    );
  }
}
