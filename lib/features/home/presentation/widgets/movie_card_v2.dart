import 'package:flutter/material.dart';
import '../../../movies/domain/models/movie.dart';

class FeaturedMovieCard extends StatelessWidget {
  final Movie movie;

  const FeaturedMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.9,
      margin: const EdgeInsets.symmetric(horizontal: 8),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),

        child: AspectRatio(
          aspectRatio: 2 / 1,
          child: Image.asset(movie.bannerPath, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
