import 'package:flutter/material.dart';
import 'package:lconnect/constants/app_colors.dart';
import 'package:lconnect/constants/app_names.dart';
import 'package:lconnect/screens/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration("Email", Icons.email),
                  validator: (value) =>
                  value!.contains("@") ? null : "Enter valid email",
                ),
                SizedBox(height: 15,),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: _inputDecoration("Password", Icons.lock),
                  validator: (value) =>
                  value!.length < 6 ? "Min 6 characters" : null,
                ),
                SizedBox(height: 15,),
                SizedBox(height: 15,),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Do login logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Logged in ✅")),
                        );
                      }
                    },
                    child: Text("Sign In", style: AppFontStyle.headingStyle),
                  ),
                ),
                SizedBox(height: 15,),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // 👉 Navigate to Login Screen
                      Navigator.push(context, MaterialPageRoute(builder: (_) => CollegeHome()));
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(color: AppColors.textLight),
                        children: [
                          TextSpan(
                            text: "Login",
                            style: TextStyle(
                              color: AppColors.chat,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ])),
            ),
          ],
        ),
      ),
    );
  }
  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: AppColors.chat),
      hintText: hint,
      filled: true,
      fillColor: Colors.grey[100],
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
    );
  }
}


