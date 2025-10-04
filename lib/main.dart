import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lconnect/constants/approute.dart';
import 'package:lconnect/constants/profile_screen.dart';
import 'package:lconnect/screens/chat_screen.dart';
import 'package:lconnect/screens/con.dart';
import 'package:lconnect/screens/confession.dart';
import 'package:lconnect/screens/home.dart';
import 'package:lconnect/screens/home_screen.dart';
import 'package:lconnect/screens/login_screen.dart';
import 'package:lconnect/screens/signup_screen.dart';
import 'package:lconnect/screens/splash_screen.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute:AppRoutes.generateRoute,
      theme: ThemeData(


      ),
      home: SplashScreen(),
    );
  }
}


