import 'package:flutter/material.dart';
import 'package:lconnect/constants/app_names.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            Icon(Icons.edgesensor_high, color: Colors.blue, size: 50),
            SizedBox(height: 10),
            Text("Welcome Back!", style: AppFontStyle.darkheadingStyle),
            Text("Join your College Community"),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Form(child: Column(children: [
                formtextfield,
                SizedBox(height: 15,),
                formtextfield,
                SizedBox(height: 15,),
                formtextfield,
                SizedBox(height: 15,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue
                        ,borderRadius: BorderRadius.circular(20),
                    
                  ),
                  child: Center(child: Text("Sign in",style: AppFontStyle.headingStyle,)),
                ),SizedBox(height: 15,),
                Text("Did'nt Have Account ")
              ])),
            ),
          ],
        ),
      ),
    );
  }
}

Widget formtextfield = TextField(
  decoration: InputDecoration(
    hintText: "Password",
    prefixIcon: Icon(Icons.person,color: Colors.blue,),

    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
  ),
);
