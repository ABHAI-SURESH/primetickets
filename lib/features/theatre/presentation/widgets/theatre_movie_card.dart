import 'package:flutter/material.dart';
import '../../../movies/domain/models/movie.dart';

class TheatreMovieCard extends StatelessWidget {
  final Movie movie;

  const TheatreMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),

          child: Image.asset(
            movie.posterPath,
            width: 80,
            height: 110,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                '${movie.certificate} • ${movie.languages.first} • 2D',
                style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
              ),

              const SizedBox(height: 4),

              Text(
                movie.genre,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
