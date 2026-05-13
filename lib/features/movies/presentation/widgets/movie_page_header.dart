import 'package:flutter/material.dart';

class MoviePageHeader extends StatelessWidget {
  final String location;
  final int movieCount;
  final VoidCallback onSearchTap;

  const MoviePageHeader({
    super.key,
    required this.location,
    required this.movieCount,
    required this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          /// LEFT SIDE
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text(
                  'Now Showing',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),

                const SizedBox(height: 4),

                Text(
                  '$location | $movieCount Movies',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),

          /// RIGHT SEARCH BUTTON
          GestureDetector(
            onTap: onSearchTap,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: const Icon(Icons.search, size: 24),
            ),
          ),
        ],
      ),
    );
  }
}
