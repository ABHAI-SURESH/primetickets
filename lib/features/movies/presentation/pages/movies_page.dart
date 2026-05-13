import 'package:flutter/material.dart';

import '../widgets/movie_grid_card.dart';
import '../widgets/movie_page_header.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> movieImages = [
      'assets/images/doomsday.jpg',
      'assets/images/dune.jpg',
      'assets/images/infinity_war.jpg',
      'assets/images/spiderman.jpg',
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            /// 🔹 HEADER
            MoviePageHeader(
              location: 'Trivandrum',
              movieCount: movieImages.length,
              onSearchTap: () {
                // Navigate to search page
              },
            ),

            /// 🔹 GRID
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),

                itemCount: movieImages.length,

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),

                itemBuilder: (context, index) {
                  return MovieGridCard(imagePath: movieImages[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
