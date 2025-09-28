import 'package:flutter/material.dart';
import 'package:lconnect/constants/app_names.dart';
import 'package:lconnect/constants/swipecard.dart';
import 'package:lconnect/constants/tab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //bottomNavigationBar: BottomTab(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Welcome", style: AppFontStyle.mainheadingStyle),
                        Text(
                          "San Fransico,CA",
                          style: AppFontStyle.darklightheadingStyle,
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange[800],
                      ),
                      child: Icon(Icons.dehaze, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    /* fillColor: Colors.red,
                    filled: true,*/
                    hintStyle: AppFontStyle.darksmallStyle,
                    prefixIcon: Icon(Icons.search),
                    /*                    enabledBorder: ,*/
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      // When user taps on field
                      borderSide: BorderSide(width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),

                SizedBox(height: 30),
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 4,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0, bottom: 10),
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(width: 2),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0 ),
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20))
                                  ,child: Image.asset("assets/couple.png"),
                                ),
                              ),
                              SizedBox(width: 30),
                              Column(
                                children: [
                                  Text(
                                    "Confession",
                                    style: AppFontStyle.mainheadingStyle,
                                  ),
                                  Text("Find your love one ",style: AppFontStyle.darksmallStyle,)
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ) /*SizedBox(
                  height: 500,
                  child: PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 4,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.red,
                          ),
                        ),
                      );
                    },
                  ),
                ),*/,
                /*  SizedBox(height: 10),
                Text("Features", style: AppFontStyle.mainheadingStyle),
                SizedBox(height: 400,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      crossAxisCount: 2,


                    ), itemCount: 4,itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                        child: Text("Dating"),
                      );
                  },
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
