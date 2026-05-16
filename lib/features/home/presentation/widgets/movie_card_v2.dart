import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl;

  // Removed the 'scale' parameter from here. The Carousel handles it now.
  const MovieCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240, // Added explicit width
      height: 360, // Added explicit height
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              0.14,
            ), // Adjusted to match your original
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
      ),
    );
  }
}
