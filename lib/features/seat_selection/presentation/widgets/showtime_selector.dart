import 'package:flutter/material.dart';
import '../../domain/models/show.dart';

class ShowtimeSelector extends StatelessWidget {
  final List<Show> shows;

  final String selectedShowId;

  final Function(Show) onShowSelected;

  const ShowtimeSelector({
    super.key,
    required this.shows,
    required this.selectedShowId,
    required this.onShowSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,

      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),

        scrollDirection: Axis.horizontal,

        itemCount: shows.length,

        separatorBuilder: (_, __) => const SizedBox(width: 10),

        itemBuilder: (context, index) {
          final show = shows[index];

          final isSelected = show.id == selectedShowId;

          return InkWell(
            borderRadius: BorderRadius.circular(10),

            onTap: () {
              onShowSelected(show);
            },

            child: Container(
              width: 130,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),

                color: isSelected ? Colors.black : Colors.white,

                border: Border.all(
                  color: isSelected ? Colors.black : Colors.grey.shade300,
                ),
              ),

              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    children: [
                      Text(
                        show.time,

                        style: TextStyle(
                          fontSize: 12,

                          fontWeight: FontWeight.w400,

                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),

                      Text(
                        show.audioFormat,

                        style: TextStyle(
                          fontSize: 10,

                          fontWeight: FontWeight.w400,

                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
