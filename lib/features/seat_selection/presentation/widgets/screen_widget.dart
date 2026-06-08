import 'package:flutter/material.dart';
import 'package:prime_tickets/features/seat_selection/domain/models/screen.dart';

class ScreenWidget extends StatelessWidget {
  final Screen screen;

  const ScreenWidget({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    int longestRowLength = 0;

    for (final section in screen.sections) {
      for (final row in section.rows) {
        if (row.cells.length > longestRowLength) {
          longestRowLength = row.cells.length;
        }
      }
    }

    const double seatSlotWidth = 24;
    final double layoutWidth = longestRowLength * seatSlotWidth;

    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 12),

      child: SizedBox(
        width: layoutWidth,
        child: Column(
          children: [
            Container(
              width: 280,
              height: 18,

              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),

                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(140),
                  topRight: Radius.circular(140),
                ),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'LOOK AT ME',

              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
