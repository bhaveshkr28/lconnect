import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lconnect/constants/app_colors.dart';
import 'package:lconnect/constants/app_names.dart';
import 'package:lconnect/screens/home.dart';
import 'package:lconnect/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _loading=false;
  final _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _loading = true);
      try {
        final user = await _authService.loginWithEmail( // Store the result of the login attempt
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );

        if (user != null && mounted) { // Check if the user is not null before navigating
          // Navigate to HomeScreen after successful login
          Navigator.pushReplacementNamed(context, "/home");
        } else if (mounted) {
          // Handle cases where the user object is null but no error was thrown
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Login failed. User object is null.")),
          );
        }
      } catch (e) {
        if (mounted) {
          // This catch block handles exceptions like wrong password
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Login failed: $e")),
          );
        }
      } finally {
        if (mounted) {
          setState(() => _loading = false);
        }
      }
    }
  }

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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: _inputDecoration("Email", Icons.email),
                      validator:
                          (value) =>
                              value!.contains("@") ? null : "Enter valid email",
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: _inputDecoration("Password", Icons.lock),
                      validator:
                          (value) =>
                              value!.length < 6 ? "Min 6 characters" : null,
                    ),
                    SizedBox(height: 15),
                    SizedBox(height: 15),
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
                          _signIn();
                        },
                        child: Text(
                          "Sign In",
                          style: AppFontStyle.headingStyle,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // 👉 Navigate to Login Screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => CollegeHome()),
                          );
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
                  ],
                ),
              ),
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
    );
  }
}
