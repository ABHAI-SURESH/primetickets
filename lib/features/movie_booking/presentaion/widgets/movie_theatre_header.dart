import 'package:flutter/material.dart';

class MovieTheatresHeader extends StatelessWidget {
  final String movieTitle;
  final bool isSearching;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onBack;
  final VoidCallback onSearchTap;
  final VoidCallback onCloseSearch;

  const MovieTheatresHeader({
    super.key,
    required this.movieTitle,
    required this.isSearching,
    required this.onSearchChanged,
    required this.onBack,
    required this.onSearchTap,
    required this.onCloseSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 16),

      child: Row(
        children: [
          if (!isSearching) ...[
            GestureDetector(
              onTap: onBack,

              child: const Icon(Icons.arrow_back_ios, size: 18),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                movieTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,

                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            GestureDetector(
              onTap: onSearchTap,

              child: const Icon(Icons.search, size: 28),
            ),
          ] else ...[
            Expanded(
              child: TextField(
                autofocus: true,
                onChanged: onSearchChanged,

                decoration: const InputDecoration(
                  icon: Icon(Icons.search, size: 28, color: Colors.black),
                  hintText: 'Search theatres...',
                  border: InputBorder.none,
                ),
              ),
            ),

            GestureDetector(
              onTap: onCloseSearch,

              child: const Icon(Icons.close, size: 28),
            ),
          ],
        ],
      ),
    );
  }
}
