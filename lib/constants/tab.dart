import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:lconnect/screens/home_screen.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // just to see the floating effect
      body: BottomBar(
        width: MediaQuery.of(context).size.width ,
        // slightly smaller to float

        borderRadius: BorderRadius.circular(30),
        barAlignment: Alignment.bottomCenter,
        barDecoration: BoxDecoration(
          color: Colors.white, // <-- White floating bar
          borderRadius: BorderRadius.circular(80),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        fit: StackFit.expand,
        body:
            (context, scrollController) => TabBarView(
              controller: _controller,
              children: [
               HomeScreen(),

                Center(child: Text("Dating Page")),
                Center(child: Text("Chat Page")),
                Center(child: Text("Fav Page")),
                Center(child: Text("Profile Page")),
              ],
            ),
        child: TabBar(

      //    padding: EdgeInsets.symmetric(vertical: 10),
          controller: _controller,
          labelColor:  Colors.orange[800],

          unselectedLabelColor: Colors.white,
          indicator: BoxDecoration(

          // color: Colors.orange[800],
          ),
          tabs: const [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.favorite)),
            Tab(icon: Icon(Icons.chat)),
            Tab(icon: Icon(Icons.star)),
            Tab(icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
