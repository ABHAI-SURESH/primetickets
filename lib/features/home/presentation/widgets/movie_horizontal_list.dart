import 'package:flutter/material.dart';

import 'small_movie_card.dart';

class MovieHorizontalList extends StatelessWidget {
  const MovieHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> movieImages = [
      'assets/images/doomsday.jpg',
      'assets/images/dune.jpg',
      'assets/images/infinity_war.jpg',
      'assets/images/spiderman.jpg',
    ];

    return SizedBox(
      height: 300,

      child: ListView.separated(
        scrollDirection: Axis.horizontal,

        physics: const BouncingScrollPhysics(),

        padding: const EdgeInsets.symmetric(horizontal: 20),

        itemCount: movieImages.length,

        separatorBuilder: (context, index) {
          return const SizedBox(width: 16);
        },

        itemBuilder: (context, index) {
          return SmallMovieCard(imagePath: movieImages[index]);
        },
      ),
    );
  }
}
