import 'package:flutter/material.dart';
import 'package:prime_tickets/features/search/presentation/pages/search_page.dart';
import 'package:prime_tickets/features/movies/data/dummy_movies.dart';
import '../widgets/movie_filter_bar.dart';
import '../widgets/movie_grid_card.dart';
import '../widgets/movie_page_header.dart';

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
    final movies = dummyMovies;
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            /// HEADER
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

            ///GRID
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 100),

                itemCount: movies.length,

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 24,
                  childAspectRatio: 0.52,
                ),

                itemBuilder: (context, index) {
                  final movie = movies[index];

                  return MovieGridCard(movie: movie);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
