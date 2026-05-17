import 'package:flutter/material.dart';
import 'package:prime_tickets/features/search/presentation/pages/search_page.dart';

import '../widgets/movie_filter_bar.dart';
import '../widgets/movie_grid_card.dart';
import '../widgets/movie_page_header.dart';
import '../../domain/models/movie.dart';

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
        id: '1',
        title: 'Doomsday',
        imagePath: 'assets/images/doomsday.jpg',
        genre: 'Action . Thriller',
        duration: '2h 10m',
        certificate: 'UA16+',
        languages: ['English'],
        rating: 8.5 / 10,
        description: 'A deadly virus outbreak threatens humanity’s survival.',
        bookedCount: 1800,
      ),

      Movie(
        id: '2',
        title: 'Dune',
        imagePath: 'assets/images/dune.jpg',
        genre: 'Sci-Fi . Adventure',
        duration: '2h 35m',
        certificate: 'U',
        languages: ['English', 'Hindi'],
        rating: 7.9,
        description:
            'A noble family becomes embroiled in a war for control over a desert planet.',
        bookedCount: 2500,
      ),

      Movie(
        id: '3',
        title: 'Infinity War',
        imagePath: 'assets/images/infinity_war.jpg',
        genre: 'Action . Sci-Fi',
        duration: '2h 30m',
        certificate: 'UA13+',
        languages: ['English', 'Hindi'],
        rating: 9.0,
        description:
            'As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy, his goal is to collect all six Infinity Stones, artifacts of unimaginable power, and use them to inflict his twisted will on all of reality. Everything the Avengers have fought for has led up to this moment - the fate of Earth and existence itself has never been more uncertain.',
        bookedCount: 5000,
      ),

      Movie(
        id: '4',
        title: 'Spiderman Far From Home',
        imagePath: 'assets/images/spiderman.jpg',
        genre: 'Superhero . Action',
        duration: '2h 10m',
        certificate: 'UA13+',
        languages: ['English', 'Malayalam'],
        rating: 8.2,
        description:
            'Peter Parker goes on a school trip and faces new threats.',
        bookedCount: 2100,
      ),

      Movie(
        id: '5',
        title: 'Spiderman',
        imagePath: 'assets/images/spiderman.jpg',
        genre: 'Superhero',
        duration: '2h 05m',
        certificate: 'UA13+',
        languages: ['Malayalam'],
        rating: 8.2,
        description: 'The origin story of Spider-Man.',
        bookedCount: 1500,
      ),

      Movie(
        id: '6',
        title: 'Project Hail Mary',
        imagePath: 'assets/images/projecthailmary.jpeg',
        genre: 'Sci-Fi',
        duration: '2h 20m',
        certificate: 'UA13+',
        languages: ['English'],
        rating: 10.0,
        description: 'A lone astronaut must save Earth from extinction.',
        bookedCount: 3200,
      ),

      Movie(
        id: '7',
        title: 'Deadpool and Wolverine',
        imagePath: 'assets/images/deadpool_wolverine.jpeg',
        genre: 'Action . Comedy',
        duration: '2h 05m',
        certificate: 'UA18+',
        languages: ['English'],
        rating: 9.0,
        description: 'Deadpool teams up with Wolverine in a chaotic adventure.',
        bookedCount: 4000,
      ),

      Movie(
        id: '8',
        title: 'The Dark Knight',
        imagePath: 'assets/images/the_dark_knight.jpeg',
        genre: 'Crime . Action',
        duration: '2h 32m',
        certificate: 'UA13+',
        languages: ['English'],
        rating: 10.0,
        description: 'Batman faces his greatest enemy, the Joker.',
        bookedCount: 8000,
      ),

      Movie(
        id: '9',
        title: 'Zootopia 2',
        imagePath: 'assets/images/zootopia_2.jpeg',
        genre: 'Animation . Family',
        duration: '1h 50m',
        certificate: 'UA13+',
        languages: ['English'],
        rating: 8.0,
        description: 'The adventures in Zootopia continue with new mysteries.',
        bookedCount: 1200,
      ),

      Movie(
        id: '10',
        title: 'F1 The Movie',
        imagePath: 'assets/images/f1_themovie.jpeg',
        genre: 'Sports . Drama',
        duration: '2h 15m',
        certificate: 'UA13+',
        languages: ['English'],
        rating: 7.0,
        description: 'A high-speed journey into the world of Formula 1 racing.',
        bookedCount: 900,
      ),

      Movie(
        id: '11',
        title: 'Inception',
        imagePath: 'assets/images/inception.jpeg',
        genre: 'Sci-Fi . Thriller',
        duration: '2h 28m',
        certificate: 'UA13+',
        languages: ['English'],
        rating: 6.0,
        description: 'A thief enters dreams to steal secrets.',
        bookedCount: 3000,
      ),

      Movie(
        id: '12',
        title: 'Top Gun Maverick',
        imagePath: 'assets/images/topgun_maverik.jpeg',
        genre: 'Action . Drama',
        duration: '2h 10m',
        certificate: 'UA13+',
        languages: ['English'],
        rating: 10.0,
        description: 'Maverick returns to train a new generation of pilots.',
        bookedCount: 6000,
      ),

      Movie(
        id: '13',
        title: 'Avatar: Fire and Ash',
        imagePath: 'assets/images/avatar_fire_and_ash.jpeg',
        genre: 'Fantasy . Sci-Fi',
        duration: '2h 40m',
        certificate: 'UA13+',
        languages: ['English'],
        rating: 10.0,
        description: 'A new chapter unfolds in the world of Pandora.',
        bookedCount: 7000,
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
