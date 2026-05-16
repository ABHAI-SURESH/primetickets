import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl;

  const MovieCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),

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
    );
  }
}
