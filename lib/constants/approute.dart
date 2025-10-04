// lib/app_routes.dart
import 'package:flutter/material.dart';
import 'package:lconnect/screens/home.dart';
import 'package:lconnect/screens/home_screen.dart';
import 'package:lconnect/screens/login_screen.dart';
import 'package:lconnect/screens/signup_screen.dart';


class AppRoutes {
  static const String signup = "/signup";
  static const String login = "/login";
  static const String home = "/home";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const CollegeHome());
    /*  case home:
        return MaterialPageRoute(builder: (_) => const CollegeHome());
      case home:
        return MaterialPageRoute(builder: (_) => const CollegeHome());*/
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("No route defined")),
          ),
        );
    }
  }
}
