import 'package:flutter/material.dart';
import 'package:prime_tickets/features/search/presentation/pages/search_page.dart';

import '../widgets/movie_filter_bar.dart';
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

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  int selectedFilter = 0;

  final List<String> filters = [
    'Filter',
    'English',
    'Malayalam',
    'Tamil',
    'Hindi',
    'New Releases',
  ];

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
        title: 'Spiderman far from home',
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
      Movie(
        imagePath: 'assets/images/projecthailmary.jpeg',
        title: 'Project Hail Mary',
        language: 'English',
        certificate: 'UA13+',
        rating: 10.0,
      ),
      Movie(
        imagePath: 'assets/images/deadpool_wolverine.jpeg',
        title: 'Deadpool and Wolverine',
        language: 'English',
        certificate: 'UA18+',
        rating: 9.0,
      ),
      Movie(
        imagePath: 'assets/images/the_dark_knight.jpeg',
        title: 'The Dark Knight',
        language: 'English',
        certificate: 'UA13+',
        rating: 10.0,
      ),
      Movie(
        imagePath: 'assets/images/zootopia_2.jpeg',
        title: 'Zootopia 2',
        language: 'English',
        certificate: 'UA13+',
        rating: 8.0,
      ),
      Movie(
        imagePath: 'assets/images/f1_themovie.jpeg',
        title: 'F1 The Movie',
        language: 'English',
        certificate: 'UA13+',
        rating: 7.0,
      ),
      Movie(
        imagePath: 'assets/images/inception.jpeg',
        title: 'Inception',
        language: 'English',
        certificate: 'UA13+',
        rating: 6.0,
      ),
      Movie(
        imagePath: 'assets/images/topgun_maverik.jpeg',
        title: 'Top Gun Maverik',
        language: 'English',
        certificate: 'UA13+',
        rating: 10.0,
      ),
      Movie(
        imagePath: 'assets/images/avatar_fire_and_ash.jpeg',
        title: 'Avatar : Fire and Ash',
        language: 'English',
        certificate: 'UA13+',
        rating: 10.0,
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
            const SizedBox(height: 8),

            MovieFilterBar(
              filters: filters,
              selectedIndex: selectedFilter,
              onTap: (index) {
                setState(() {
                  selectedFilter = index;
                });
              },
            ),

            const SizedBox(height: 8),

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
