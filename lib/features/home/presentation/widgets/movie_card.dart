import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl;
  final double scale;

  const MovieCard({super.key, required this.imageUrl, required this.scale});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,

      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),

          child: Image.asset(imageUrl, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
