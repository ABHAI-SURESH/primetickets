import 'package:flutter/material.dart';
import 'package:prime_tickets/features/home/presentation/widgets/movie_info_capsule.dart';

import 'package:prime_tickets/features/movies/domain/models/movie.dart';

class FeaturedMovieInfo extends StatelessWidget {
  final Movie movie;

  const FeaturedMovieInfo({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),

      child: Column(
        key: ValueKey(movie.id),

        children: [
          Text(
            movie.title.toUpperCase(),
            textAlign: TextAlign.center,

            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              MovieInfoCapsule(text: movie.genre),

              const SizedBox(width: 8),

              MovieInfoCapsule(text: movie.duration),

              const SizedBox(width: 8),

              MovieInfoCapsule(text: "⭐ ${movie.rating}"),
            ],
          ),
        ],
      ),
    );
  }
}
