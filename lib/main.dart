import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hisabcha/utils/constants.dart';

import 'home/home_vu.dart';

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
      home: const HomeView(),
    );
  }
}
