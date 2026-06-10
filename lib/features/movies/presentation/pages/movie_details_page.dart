import 'package:flutter/material.dart';
import 'package:prime_tickets/features/movie_booking/presentaion/pages/movie_theatres_page.dart';
import 'package:prime_tickets/features/movies/data/dummy_movies.dart';
import 'package:prime_tickets/features/movies/presentation/widgets/movie_background.dart';
import 'package:prime_tickets/features/movies/presentation/widgets/movie_book_tickets_button.dart';
import 'package:prime_tickets/features/movies/presentation/widgets/movie_people_section.dart';
import 'package:prime_tickets/features/movies/presentation/widgets/movie_genre_rating.dart';
import 'package:prime_tickets/features/movies/presentation/widgets/movie_meta_info.dart';
import 'package:prime_tickets/features/movies/presentation/widgets/movie_poster_card.dart';
import 'package:prime_tickets/features/movies/domain/models/movie.dart';
import 'package:prime_tickets/features/movies/presentation/widgets/movie_description.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;

  const MovieDetailsPage({super.key, required this.movie});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final releasedMovies = dummyMovies
      .where((movie) => movie.isReleased)
      .toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ///BACKGROUND (ONLY ONCE)
          MovieBackground(imagePath: widget.movie.posterPath),

          ///CONTENT
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// BACK BUTTON
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 24),

                  ///POSTER CARD
                  MoviePosterCard(imagePath: widget.movie.bannerPath),

                  const SizedBox(height: 16),

                  ///GENRE AND RATING
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MovieGenreRating(
                      genre: widget.movie.genre,
                      rating: widget.movie.rating,
                    ),
                  ),

                  const SizedBox(height: 10),

                  ///MOVIE TITLE
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.movie.title.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  ///META INFO
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MovieMetaInfo(
                      certificate: widget.movie.certificate,
                      language: widget.movie.languages.first,
                      duration: widget.movie.duration,
                      releaseDate: widget.movie.releaseDate,
                    ),
                  ),

                  const SizedBox(height: 20),

                  ///DESCRIPTION
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MovieDescription(
                      description: widget.movie.description,
                    ),
                  ),

                  const SizedBox(height: 20),

                  ///CAST SECTION
                  PeopleSection(title: 'Cast', people: widget.movie.cast),

                  const SizedBox(height: 4),

                  ///CREW SECTION
                  PeopleSection(title: 'Crew', people: widget.movie.crew),

                  const SizedBox(height: 4),
                ],
              ),
            ),
          ),
        ],
      ),

      ///BOOK TICKETS BUTTON
      bottomNavigationBar: BookTicketButton(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MovieTheatresPage(movie: widget.movie),
            ),
          );
        },
      ),
    );
  }
}
