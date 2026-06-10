import 'package:flutter/material.dart';

class MoviePosterCard extends StatelessWidget {
  final String imagePath;

  const MoviePosterCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          /// POSTER
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: AspectRatio(
              aspectRatio: 2 / 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],

                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          ///TRAILER BUTTON
          Positioned(
            bottom: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.65),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.play_arrow, color: Colors.white, size: 18),
                  SizedBox(width: 6),
                  Text(
                    "Watch Trailer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
