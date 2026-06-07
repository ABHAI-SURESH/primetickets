import 'package:flutter/material.dart';
import '../../../movies/presentation/pages/movie_details_page.dart';
import '../../../movies/domain/models/movie.dart';

class SmallMovieCard extends StatelessWidget {
  final Movie movie;

  const SmallMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => MovieDetailsPage(movie: movie)),
        );
      },
      child: Container(
        width: 150,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),

              blurRadius: 14,

              offset: const Offset(0, 8),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),

          child: Image.asset(
            movie.imagePath,

            fit: BoxFit.cover,

            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }
}
