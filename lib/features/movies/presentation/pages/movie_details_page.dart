import 'package:flutter/material.dart';
import '../../domain/models/movie.dart';
import '../widgets/movie_description.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                /// POSTER IMAGE
                Image.asset(
                  movie.imagePath,
                  width: double.infinity,
                  height: 400,
                  fit: BoxFit.cover,
                ),

                /// GRADIENT
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.white],
                      ),
                    ),
                  ),
                ),

                /// BACK BUTTON
                Positioned(
                  top: MediaQuery.of(context).padding.top + 10,
                  left: 16,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ),

                /// TRAILER BUTTON
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.play_arrow, color: Colors.white),
                          SizedBox(width: 6),
                          Text(
                            "Watch Full Trailer",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                ///MOVIE GENRE
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Text(movie.genre),
                ),

                const Spacer(),

                ///MOVIE RATING
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.star, size: 24, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        '${movie.rating}/10',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            ///MOVIE TITLE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(movie.title, style: const TextStyle(fontSize: 24)),
            ),

            ///MOVIE META INFO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text(
                '${movie.certificate}  .  ${movie.languages.first}  .  ${movie.duration}',
                style: const TextStyle(fontSize: 12),
              ),
            ),

            const SizedBox(height: 12),

            ///MOVIE DESCRIPTION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MovieDescription(description: movie.description),
            ),

            const SizedBox(height: 12),

            ///MOVIE TICKET BOOKED COUNT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16), //
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),

                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey.shade300),
                ),

                child: Center(
                  child: Text(
                    '${movie.bookedCount} tickets booked today',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
