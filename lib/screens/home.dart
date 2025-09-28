import 'package:flutter/material.dart';
import 'package:lconnect/constants/app_colors.dart';

class CollegeHome extends StatelessWidget {
  const CollegeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView( // ✅ make screen scrollable
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hi, Bhavesh 👋",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Welcome back!",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage("assets/profile.png"),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// SEARCH BAR
              TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// CATEGORIES GRID
              const Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              GridView.count(
                shrinkWrap: true, // ✅ grid takes only needed height
                physics: const NeverScrollableScrollPhysics(), // ✅ disable inner scroll
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
                children: [
                  _buildCategoryCard(
                    icon: Icons.favorite,
                    title: "Confession",
                    color: Colors.pinkAccent,
                  ),
                  _buildCategoryCard(
                    icon: Icons.chat,
                    title: "Chat",
                    color: Colors.blue,
                  ),
                  _buildCategoryCard(
                    icon: Icons.videogame_asset,
                    title: "Gaming",
                    color: Colors.green,
                  ),
                  _buildCategoryCard(
                    icon: Icons.event,
                    title: "Events",
                    color: Colors.orange,
                  ),
                  _buildCategoryCard(
                    icon: Icons.book_outlined,
                    title: "Notes",
                    color: Colors.orange,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// TRENDING SECTION
              const Text(
                "Trending",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildTrendingCard("Gaming Night", "20 joined"),
                    _buildTrendingCard("Music Fest", "35 joined"),
                    _buildTrendingCard("Hackathon", "12 joined"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// CATEGORY CARD
  static Widget _buildCategoryCard({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  /// TRENDING CARD
  static Widget _buildTrendingCard(String title, String subtitle) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(2, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(subtitle, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
