import 'package:flutter/material.dart';
import 'package:prime_tickets/features/movies/presentation/widgets/movie_background.dart';
import 'package:prime_tickets/features/movies/presentation/widgets/movie_book_tickets_button.dart';
import 'package:prime_tickets/features/movies/presentation/widgets/movie_people_section.dart';
import 'package:prime_tickets/features/movies/presentation/widgets/movie_genre_rating.dart';
import 'package:prime_tickets/features/movies/presentation/widgets/movie_meta_info.dart';
import 'package:prime_tickets/features/movies/presentation/widgets/movie_poster_card.dart';
import 'package:prime_tickets/features/movies/domain/models/movie.dart';
import 'package:prime_tickets/features/movies/presentation/widgets/movie_description.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ///BACKGROUND (ONLY ONCE)
          MovieBackground(imagePath: movie.imagePath),

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

                  const SizedBox(height: 10),

                  ///POSTER CARD
                  MoviePosterCard(imagePath: movie.imagePath),

                  const SizedBox(height: 8),

                  ///GENRE AND RATING
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MovieGenreRating(
                      genre: movie.genre,
                      rating: movie.rating,
                    ),
                  ),

                  const SizedBox(height: 10),

                  ///MOVIE TITLE
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      movie.title.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  ///META INFO
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MovieMetaInfo(
                      certificate: movie.certificate,
                      language: movie.languages.first,
                      duration: movie.duration,
                    ),
                  ),

                  const SizedBox(height: 20),

                  ///DESCRIPTION
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MovieDescription(description: movie.description),
                  ),

                  const SizedBox(height: 20),

                  ///CAST SECTION
                  PeopleSection(title: 'Cast', people: movie.cast),

                  const SizedBox(height: 4),

                  ///CREW SECTION
                  PeopleSection(title: 'Crew', people: movie.crew),

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
          print("Book Tickets clicked");
        },
      ),
    );
  }
}
