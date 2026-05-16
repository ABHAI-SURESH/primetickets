import 'package:flutter/material.dart';
import 'movie_card.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({super.key});

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  late final PageController pageController;

  double currentPage = 0;

  final List<String> movieImages = [
    'assets/images/doomsday.jpg',
    'assets/images/dune.jpg',
    'assets/images/infinity_war.jpg',
    'assets/images/spiderman.jpg',
  ];

  @override
  void initState() {
    super.initState();

    pageController = PageController(viewportFraction: 0.72, initialPage: 1000);

    currentPage = 1000;

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
    final currentIndex = currentPage.round() % movieImages.length;

    return Column(
      children: [
        /// 🔥 FIXED PROPORTION (NO HEIGHT BUG)
        AspectRatio(
          aspectRatio: 0.9,

          child: PageView.builder(
            controller: pageController,

            itemBuilder: (context, index) {
              final movieIndex = index % movieImages.length;

              final difference = (currentPage - index).abs();

              double scale = 1 - (difference * 0.18);

              if (scale < 0.75) {
                scale = 0.75;
              }

              return Transform.scale(
                scale: scale,

                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),

                  child: MovieCard(imageUrl: movieImages[movieIndex]),
                ),
              );
            },
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
                color: isActive ? Colors.black : Colors.grey.shade400,

                borderRadius: BorderRadius.circular(20),
              ),
            );
          }),
        ),
      ],
    );
  }
}
