import 'package:flutter/material.dart';

class SeatSelectionHeader extends StatelessWidget {
  final String movieTitle;

  final String theatreName;

  final VoidCallback onBack;

  const SeatSelectionHeader({
    super.key,
    required this.movieTitle,
    required this.theatreName,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,

      padding: const EdgeInsets.symmetric(horizontal: 16),

      child: Row(
        children: [
          InkWell(
            onTap: onBack,

            borderRadius: BorderRadius.circular(20),

            child: const Padding(
              padding: EdgeInsets.all(8),

              child: Icon(Icons.arrow_back_ios_new, size: 20),
            ),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  movieTitle,

                  maxLines: 1,

                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  theatreName,

                  maxLines: 1,

                  overflow: TextOverflow.ellipsis,

                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
