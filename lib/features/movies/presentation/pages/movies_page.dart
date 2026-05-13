import 'package:flutter/material.dart';
import 'package:prime_tickets/features/search/presentation/pages/search_page.dart';

import '../widgets/movie_grid_card.dart';
import '../widgets/movie_page_header.dart';

class Movie {
  final String imagePath;
  final String title;
  final String language;
  final String certificate;
  final double rating;

  Movie({
    required this.imagePath,
    required this.title,
    required this.language,
    required this.certificate,
    required this.rating,
  });
}

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Movie> movies = [
      Movie(
        imagePath: 'assets/images/doomsday.jpg',
        title: 'Doomsday',
        language: 'English',
        certificate: 'UA16+',
        rating: 8.5,
      ),
      Movie(
        imagePath: 'assets/images/dune.jpg',
        title: 'Dune',
        language: 'English',
        certificate: 'U',
        rating: 7.9,
      ),
      Movie(
        imagePath: 'assets/images/infinity_war.jpg',
        title: 'Infinity War',
        language: 'English',
        certificate: 'UA13+',
        rating: 9.0,
      ),
      Movie(
        imagePath: 'assets/images/spiderman.jpg',
        title: 'Spiderman far from homeyhujkyuiyui',
        language: 'Malayalam',
        certificate: 'UA13+',
        rating: 8.2,
      ),
      Movie(
        imagePath: 'assets/images/spiderman.jpg',
        title: 'Spiderman',
        language: 'Malayalam',
        certificate: 'UA13+',
        rating: 8.2,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            /// 🔹 HEADER
            MoviePageHeader(
              location: 'Trivandrum',
              movieCount: movies.length,
              onSearchTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SearchPage()),
                );
              },
            ),
            SizedBox(height: 5),

            /// 🔹 GRID
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),

                itemCount: movies.length,

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 24,
                  childAspectRatio: 0.58,
                ),

                itemBuilder: (context, index) {
                  final movie = movies[index];

                  return MovieGridCard(
                    imagePath: movie.imagePath,
                    title: movie.title,
                    language: movie.language,
                    certificate: movie.certificate,
                    rating: movie.rating,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
