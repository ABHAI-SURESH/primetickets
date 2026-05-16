import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'movie_card.dart'; // Make sure to import your new card

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({super.key});

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  late final PageController pageController;
  double currentPage = 0.0;

  final List<String> movieImages = [
    'assets/images/doomsday.jpg',
    'assets/images/dune.jpg',
    'assets/images/infinity_war.jpg',
    'assets/images/spiderman.jpg',
  ];

  @override
  void initState() {
    super.initState();
    // 0.6 viewportFraction pulls the invisible gesture targets closer
    pageController = PageController(viewportFraction: 0.6, initialPage: 0);

    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = currentPage.round(); // For your dots indicator

    return Column(
      children: [
        SizedBox(
          height: 400,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 1. VISUAL LAYER (The manually sorted stack)
              ..._buildStackedCards(),

              // 2. GESTURE LAYER (The transparent PageView)
              PageView.builder(
                controller: pageController,
                itemCount: movieImages.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.transparent, // Invisible swipe targets
                  );
                },
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        // YOUR ORIGINAL DOTS INDICATOR
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(movieImages.length, (index) {
            final isActive = index == currentIndex;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: isActive ? 24 : 8,
              decoration: BoxDecoration(
                color: isActive
                    ? Colors.white
                    : Colors.grey.shade600, // Adjusted for dark theme
                borderRadius: BorderRadius.circular(20),
              ),
            );
          }),
        ),
      ],
    );
  }

  List<Widget> _buildStackedCards() {
    // 1. Create a list of indices
    List<int> sortedIndexes = List.generate(movieImages.length, (i) => i);

    // 2. Sort indices so the card furthest from the center is drawn FIRST (at the back)
    sortedIndexes.sort((a, b) {
      double distA = (a - currentPage).abs();
      double distB = (b - currentPage).abs();
      return distB.compareTo(distA);
    });

    return sortedIndexes.map((index) {
      // Distance from center (0 is center, 1 is one card away)
      double offset = index - currentPage;
      double absOffset = offset.abs();

      // THE MAGIC MATH
      // Scale: Shrink cards that are further away
      double scale = math.max(0.75, 1 - absOffset * 0.18);

      // Translate: Pull the side cards behind the center card
      double translateX = offset * 120; // Tweak this number to change overlap

      // Opacity: Slightly fade out the cards in the back
      double opacity = math.max(0.3, 1 - absOffset * 0.5);

      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..translate(translateX, 0, 0)
          ..scale(scale),
        child: Opacity(
          opacity: opacity,
          child: MovieCard(imageUrl: movieImages[index]), // Using your widget!
        ),
      );
    }).toList();
  }
}
