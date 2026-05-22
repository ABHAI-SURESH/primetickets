import 'package:flutter/material.dart';
import 'movie_card.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({super.key});

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  late final PageController pageController;

  double currentPage = 1000;

  final List<String> movieImages = [
    'assets/images/doomsday.jpg',
    'assets/images/dune.jpg',
    'assets/images/infinity_war.jpg',
    'assets/images/spiderman.jpg',
    'assets/images/f1_themovie.jpeg',
  ];

  @override
  void initState() {
    super.initState();

    // viewportFraction controls swipe sensitivity here, not visual layout.
    // 0.55 ensures one swipe naturally snaps to the next card.
    pageController = PageController(viewportFraction: 0.55, initialPage: 1000);

    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page ?? 1000;
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
    final currentIndex = currentPage.round() % movieImages.length;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        /// 🔥 FIXED PROPORTION (NO HEIGHT BUG)
        AspectRatio(
          aspectRatio: 0.9,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 1. VISUAL LAYER (Handles Z-index, Overlap, Scale, Dimming)
              AnimatedBuilder(
                animation: pageController,
                builder: (context, child) {
                  double page = pageController.hasClients
                      ? (pageController.page ?? 1000)
                      : 1000;

                  // Only render the center item and its immediate neighbors to save memory
                  List<int> visibleIndices = [
                    page.floor() - 2,
                    page.floor() - 1,
                    page.floor(),
                    page.floor() + 1,
                    page.floor() + 2,
                  ];

                  // 🔥 CRITICAL FIX: Sort by distance from center descending.
                  // This forces the cards furthest away to paint first (in the back)
                  // and the center card to paint last (tucked on top of everything).
                  visibleIndices.sort((a, b) {
                    return (page - b).abs().compareTo((page - a).abs());
                  });

                  return Stack(
                    alignment: Alignment.center,
                    children: visibleIndices.map((index) {
                      final movieIndex = (index % movieImages.length).abs();
                      final difference = page - index;
                      final absDifference = difference.abs();

                      // Scale: Center is 1.0, side cards shrink to 0.75
                      double scale = (1 - (absDifference * 0.15)).clamp(
                        0.75,
                        1.0,
                      );

                      // Overlap Translation: Pulls side cards inward underneath the center card.
                      // Adjust 0.35 to control exactly how much they peek out.
                      // Lowering this value (e.g., to 0.26) pulls the side cards closer to the center.
                      // Try values between 0.24 and 0.30 to find your exact preference.
                      double translateX = -difference * (screenWidth * 0.12);

                      return Transform.translate(
                        offset: Offset(translateX, 0),
                        child: Transform.scale(
                          scale: scale,
                          child: SizedBox(
                            width:
                                screenWidth *
                                0.65, // Keeps the card width consistent
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  MovieCard(imageUrl: movieImages[movieIndex]),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),

              // 2. GESTURE LAYER (Invisible PageView to handle swiping)
              PageView.builder(
                controller: pageController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return const SizedBox.expand(); // Completely transparent touch target
                },
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        /// 🔹 DOT INDICATOR
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
                color: isActive ? Colors.white : Colors.grey.shade700,
                borderRadius: BorderRadius.circular(20),
              ),
            );
          }),
        ),
      ],
    );
  }
}
