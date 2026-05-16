import 'package:flutter/material.dart';

class SmallMovieCard extends StatelessWidget {
  final String imagePath;

  const SmallMovieCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),

            blurRadius: 14,

            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),

        child: Image.asset(
          imagePath,

          fit: BoxFit.cover,

          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
