/*
import 'package:flutter/material.dart';
import 'package:lconnect/screens/home.dart';

import '../constants/app_colors.dart';
import '../constants/app_names.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Map<String, String>> splashData = [
    {
      "image": "assets/girlboy.png",
      "title": "Express your Love to your Partner",
      "description":
          "Online dating is where people meet other and get to know each",
    },
    {
      "image": "assets/girlboy.png",
      "title": "Find Your Perfect Match",
      "description": "Swipe, chat, and meet people who share your interests",
    },
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text("Skip",style: AppFontStyle.darksmallStyle,),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: splashData.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(splashData[index]["image"]!, height: height/2),
                        //SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 5,
                          ),
                          child: Text(
                            splashData[index]["title"]!,
                            style: AppFontStyle.darkheadingStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
        
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10,
                          ),
                          child: Text(
                            splashData[index]["description"]!,
                            style: AppFontStyle.darkheadingStyle.copyWith(
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        //  SizedBox(height: 20),
                        */
/*Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              splashData.length,
                                  (index) => buildDot(index, context),
                            ),
                          ),
                        ),*//*

                        SizedBox(height: 10),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              splashData.length,
                              (index) => Container(
                                height: 10,
                                width: _currentPage == index ? 18 : 7,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10,
                          ),
                          child: InkWell(
                            //elevation: 5,
                            onTap: () {
                              if (_currentPage == splashData.length - 1) {
                                Navigator.pushReplacement(
                                    context, MaterialPageRoute(builder: (context) => CollegeHomeHome()));
                              }
                              _pageController.nextPage(
                                duration: Duration(microseconds: 500),
                                curve: Curves.bounceIn,
                              );
                            },
                            child: Container(
                              // margin: EdgeInsets.symmetric(horizontal: 20),
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                              ),
                              child: Center(
                                child: Text(
                                  _currentPage == splashData.length - 1
                                      ? "Get Started"
                                      : "Next",
                                  style: AppFontStyle.headingStyle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
        
              */
/*Text(
                "Exprese your Love to your Partner ",
                style: AppFontStyle.headingStyle,
              ),
              SizedBox(height: 20),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Online dating is where people meet other and get to know each",
                  style: AppFontStyle.lightheadingStyle,
                  textAlign: TextAlign.center,
                ),
              ),*//*

            ],
          ),
        ),
      ),
    );
  }
}
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lconnect/constants/app_colors.dart';
import 'package:lconnect/screens/home.dart';
import 'package:lconnect/screens/signup_screen.dart';
//import 'app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // clean background
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Center Image
            Expanded(
              child: Center(
                child: Image.asset(
                  "assets/groupfriends.png",
                  width: 250,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            /// Tagline
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "A College is not just a place to study,\n"
                    "it’s where memories are made 🎓✨",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
            ),

            const SizedBox(height: 40),

            /// Get Started Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
              child: SizedBox(
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
                    // 👉 Navigate to Home or Login
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SignUpScreen()));
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


