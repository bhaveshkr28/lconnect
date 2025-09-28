import 'package:flutter/material.dart';
import 'package:lconnect/constants/allgrouplist.dart';
import 'package:lconnect/constants/app_names.dart';
import 'package:lconnect/screens/group_chat_screen.dart';
import 'package:lconnect/screens/home_screen.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Preload all group images
    for (var group in groups) {
      precacheImage(AssetImage(group.image), context);
    }
  }
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        /* appBar: AppBar(
        title: Text(
        "Chat Groups",
        style: AppFontStyle.darkheadingStyle,
    ),
    centerTitle: true,
   // backgroundColor: Colors.white,
    elevation: 2, // subtle shadow
    ),*/

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //  Text("ChatBox", style: AppFontStyle.darkheadingStyle),

              /*        Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 18.0,
                  horizontal: 10,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: Offset(2, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: "poppins",
                        fontSize: 15,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none, // removes the default border
                      ),
                      filled: true,
                      fillColor: Colors.white, // keeps background white
                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    ),
                  ),
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10,
                ),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  /* decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                  ),*/
                  child: Center(
                    child: Text(
                      "Chat Groups",
                      style: TextStyle(fontSize: 30, fontFamily: 'poppins'),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Column(
                children: List.generate(6, (i) {
                  final group = groups[i];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          spreadRadius: 1,
                          offset: Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left side image
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              //color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(group.image, fit: BoxFit.cover),
                          ),
                          SizedBox(width: 10),

                          // Right side text & button
                          Expanded(
                            // <-- this makes text wrap correctly
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  group.name,
                                  style: AppFontStyle.darkheadingStyle,
                                  overflow: TextOverflow.ellipsis, // optional
                                ),
                                SizedBox(height: 5),
                                Text(
                                  group.subtitle,
                                  style: AppFontStyle.darksmallStyle,
                                  maxLines: 2, // prevent overflow
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Spacer(), // pushes button to bottom
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => GroupChatScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 80,
                                      height: 40,
                                      /* decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(20),
                                  ),*/
                                      child: Center(
                                        child: Text(
                                          "Join Now",
                                          style: AppFontStyle.darksmallStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
