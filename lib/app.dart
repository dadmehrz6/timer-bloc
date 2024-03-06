// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:timer/timer/view/timer_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: Colors.indigo.shade400),
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.white),
        ),
      ),
      home: const TimerPage(),
    );
  }
}
