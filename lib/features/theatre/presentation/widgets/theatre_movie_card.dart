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
          borderRadius: BorderRadius.circular(12),

          child: Image.asset(
            movie.imagePath,
            width: 90,
            height: 130,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                '${movie.certificate} • ${movie.languages.first} • 2D',
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 4),

              Text(movie.genre, style: TextStyle(color: Colors.grey.shade600)),
            ],
          ),
        ),
      ],
    );
  }
}
