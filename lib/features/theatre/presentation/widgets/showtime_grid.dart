import 'package:flutter/material.dart';
import '../../domain/models/show_time.dart';
import 'showtime_card.dart';

class ShowtimeGrid extends StatelessWidget {
  final List<ShowTime> shows;

  const ShowtimeGrid({super.key, required this.shows});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ((shows.length / 3).ceil()) * 75.0,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),

        itemCount: shows.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 2.1,
        ),

        itemBuilder: (context, index) {
          return ShowtimeCard(show: shows[index]);
        },
      ),
    );
  }
}
