import 'package:flutter/material.dart';

import 'home/home_vu.dart';

void main() {
  runApp(const Hisabcha());
}

class Hisabcha extends StatelessWidget {
  const Hisabcha({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const HomeView(),
    );
  }
}
