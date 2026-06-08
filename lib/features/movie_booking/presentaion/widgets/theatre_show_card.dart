import 'package:flutter/material.dart';
import 'package:prime_tickets/features/theatre/domain/models/show_time.dart';

import 'package:prime_tickets/features/theatre/domain/models/theatre.dart';
import 'package:prime_tickets/features/theatre/domain/models/theatre_show.dart';
import 'package:prime_tickets/features/theatre/presentation/widgets/showtime_grid.dart';

class TheatreShowCard extends StatelessWidget {
  final Theatre theatre;
  final TheatreShow theatreShow;
  final Function(ShowTime)? onShowSelected;

  const TheatreShowCard({
    super.key,
    required this.theatre,
    required this.theatreShow,
    required this.onShowSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            theatre.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 4),

          Text(
            theatre.place,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),

          const SizedBox(height: 14),

          ShowtimeGrid(
            shows: theatreShow.showTimes,
            onShowSelected: onShowSelected,
          ),
        ],
      ),
    );
  }
}
