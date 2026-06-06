import 'package:flutter/material.dart';
import 'package:prime_tickets/features/theatre/domain/models/show_time.dart';

class ShowtimeCard extends StatelessWidget {
  final ShowTime show;

  final VoidCallback? onTap;

  const ShowtimeCard({super.key, required this.show, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),

      onTap: onTap,

      child: Container(
        width: 110,
        height: 55,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),

          border: Border.all(color: Colors.grey.shade300),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              show.time,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 2),

            Text(
              show.screenName,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
