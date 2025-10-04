import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
           borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 50,
              width: 50,

            ),
          ),
        ],
      ),
    );
  }
}
