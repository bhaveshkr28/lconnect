import 'package:flutter/material.dart';
import 'package:lconnect/screens/chat_screen.dart';
import 'package:lconnect/screens/confession.dart';
import 'package:lconnect/screens/home.dart';
import 'package:lconnect/screens/home_screen.dart';
import 'package:lconnect/screens/login_screen.dart';
import 'package:lconnect/screens/signup_screen.dart';
import 'package:lconnect/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(

      ),
      home: SplashScreen(),
    );
  }
}


