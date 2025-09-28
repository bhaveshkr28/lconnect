import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import 'app_names.dart';

class Swipecard extends StatefulWidget {
  Swipecard({super.key});

  @override
  State<Swipecard> createState() => _SwipecardState();
}

class _SwipecardState extends State<Swipecard> {
  final CardSwiperController controller = CardSwiperController();
  final List<Map<String, String>> people = [
    {"name": "Alice", "bio": "Loves coffee ☕ and coding."},
    {"name": "Bob", "bio": "Gamer 🎮 and music fan."},
    {"name": "Charlie", "bio": "Traveler ✈️ and foodie."},
  ];  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height * 0.6;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Swipe Cards
        SizedBox(
          width: width,
          height: height,
          child: CardSwiper(
            controller: controller,
            isLoop: false,
            cardsCount: people.length,
            cardBuilder: (context, index, _, __) {
              final name = people[index];
              return Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.primaries[index % Colors.primaries.length],
                  borderRadius: BorderRadius.circular(20),
                ),
               /* child: Text(
                  name[index],
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),*/
              );
            },
            onSwipe: (previousIndex, currentIndexSwipe, direction) {
              setState(() {
                currentIndex = currentIndexSwipe!;
              });
              return true;

            },
          ),
        ),

        const SizedBox(height: 10),
        if (people.isNotEmpty)
          Column(
            children: [
              Text(
                people[currentIndex]['name']!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                people[currentIndex]['bio']!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        SizedBox(height: 15,),
        // Action Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Dislike Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(), padding: const EdgeInsets.all(20)),
              onPressed: () {
                controller.swipe(CardSwiperDirection.left); // programmatically swipe left
              },
              child: const Icon(Icons.close, color: Colors.grey, size: 32),
            ),

            // Super Like Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(), padding: const EdgeInsets.all(20)),
              onPressed: () {
                controller.swipe(CardSwiperDirection.top); // programmatically swipe up
              },
              child: const Icon(Icons.star, color: Colors.blue, size: 32),
            ),

            // Like Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(), padding: const EdgeInsets.all(20)),
              onPressed: () {
                controller.swipe(CardSwiperDirection.right); // programmatically swipe right
              },
              child: const Icon(Icons.favorite, color: Colors.red, size: 32),
            ),
          ],
        ),
      ],
    )
    ;
  }
}
