import 'package:flutter/material.dart';
import 'package:lconnect/constants/app_colors.dart';
import 'package:lconnect/screens/home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// HEADER
                const SizedBox(height: 40),
                Center(
                  child: Column(
                    children: const [
                      Icon(Icons.school, size: 60, color: AppColors.chat),
                      SizedBox(height: 12),
                      Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Join your college community 🎓",
                        style: TextStyle(color: AppColors.textLight),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                /// NAME
                TextFormField(
                  controller: _nameController,
                  decoration: _inputDecoration("Full Name", Icons.person),
                  validator: (value) =>
                  value!.isEmpty ? "Enter your name" : null,
                ),
                const SizedBox(height: 16),

                /// EMAIL
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration("Email", Icons.email),
                  validator: (value) =>
                  value!.contains("@") ? null : "Enter valid email",
                ),
                const SizedBox(height: 16),

                /// PASSWORD
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: _inputDecoration("Password", Icons.lock),
                  validator: (value) =>
                  value!.length < 6 ? "Min 6 characters" : null,
                ),
                const SizedBox(height: 30),

                /// SIGN UP BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.chat,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // 👉 Do signup logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Account Created ✅")),
                        );
                      }
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// ALREADY HAVE ACCOUNT
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Input decoration helper
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
