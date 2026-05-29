import 'package:flutter/material.dart';
import '../../domain/models/show_time.dart';
import 'showtime_card.dart';

class ShowtimeGrid extends StatelessWidget {
  final List<ShowTime> shows;

  const ShowtimeGrid({super.key, required this.shows});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,

      children: shows.map((show) {
        return ShowtimeCard(show: show);
      }).toList(),
    );
  }
}
