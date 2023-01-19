import 'package:dummy_app/Pages/Home.dart';
import 'package:dummy_app/Pages/Login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage()),
    );
  }
}
