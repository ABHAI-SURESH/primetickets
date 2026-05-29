import 'package:flutter/material.dart';
import '../../domain/models/show_time.dart';

class ShowtimeCard extends StatelessWidget {
  final ShowTime show;

  const ShowtimeCard({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 75,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),

        border: Border.all(color: Colors.grey.shade300),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(
            show.time,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 4),

          Text(
            show.screenName,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
