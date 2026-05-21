import 'package:flutter/material.dart';

class MovieGenreRating extends StatelessWidget {
  final String genre;
  final double rating;

  const MovieGenreRating({
    super.key,
    required this.genre,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///GENRE CAPSULES
        Wrap(
          spacing: 8,
          children: genre.split('•').map((g) {
            return _capsule(g.trim());
          }).toList(),
        ),

        const Spacer(),

        ///RATING CAPSULE
        _ratingCapsule('${rating % 1 == 0 ? rating.toInt() : rating}/10'),
      ],
    );
  }

  ///GENRE CAPSULE UI
  Widget _capsule(String text, {bool isDark = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.black.withOpacity(0.7)
            : Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  ///RATING CAPSULE
  Widget _ratingCapsule(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2), // 🔥 lighter shade
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star,
            size: 14,
            color: Colors.white, // 🔥 white star
          ),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
