import 'package:flutter/material.dart';
import 'package:prime_tickets/features/movies/data/dummy_movies.dart';

import 'small_movie_card.dart';

class MovieHorizontalList extends StatelessWidget {
  const MovieHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = dummyMovies;
    return SizedBox(
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),

        itemCount: movies.length,

        separatorBuilder: (_, __) => const SizedBox(width: 16),

        itemBuilder: (context, index) {
          final movie = movies[index];

          return SmallMovieCard(movie: movie);
        },
      ),
    );
  }
}
