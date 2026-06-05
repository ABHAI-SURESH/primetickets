import 'package:flutter/material.dart';

import 'package:prime_tickets/features/home/presentation/widgets/movie_card_v2.dart';
import 'package:prime_tickets/features/home/presentation/widgets/movie_info.dart';

import '../../../movies/data/dummy_movies.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({super.key});

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  late final PageController _controller;

  late int currentIndex;

  @override
  void initState() {
    super.initState();

    _controller = PageController(viewportFraction: 0.92, initialPage: 1000);

    currentIndex = 1000 % dummyMovies.length;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movie = dummyMovies[currentIndex];

    return Column(
      children: [
        SizedBox(
          height: 220,

          child: PageView.builder(
            controller: _controller,

            onPageChanged: (index) {
              setState(() {
                currentIndex = index % dummyMovies.length;
              });
            },

            itemBuilder: (context, index) {
              final movie = dummyMovies[index % dummyMovies.length];

              return FeaturedMovieCard(movie: movie);
            },
          ),
        ),

        const SizedBox(height: 16),

        FeaturedMovieInfo(movie: movie),
      ],
    );
  }
}
