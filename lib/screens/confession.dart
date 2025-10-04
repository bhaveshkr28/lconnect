import 'package:flutter/material.dart';
import 'package:lconnect/constants/app_colors.dart';

class UniqueConfessionPage extends StatefulWidget {
  const UniqueConfessionPage({super.key});

  @override
  State<UniqueConfessionPage> createState() => _UniqueConfessionPageState();
}

class _UniqueConfessionPageState extends State<UniqueConfessionPage> {
  final PageController _pageController = PageController();
  final TextEditingController _confessionController = TextEditingController();

  final List<String> confessions = [
    "I have a secret crush on someone in my class 💕",
    "The canteen samosa is the only reason I attend lectures 😅",
    "Sometimes I bunk lectures just to sleep in the library 💤",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Confessions"),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Story-like Confession Viewer
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: confessions.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 320,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.black, Colors.black87],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 5,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        confessions[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Input Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _confessionController,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Type your confession...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    if (_confessionController.text.isNotEmpty) {
                      setState(() {
                        confessions.add(_confessionController.text);
                        _confessionController.clear();
                      });
                      // Jump to new confession
                      _pageController.jumpToPage(confessions.length - 1);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.send, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
