import 'package:flutter/material.dart';

import 'package:prime_tickets/features/seat_selection/domain/models/screen.dart';

import 'seat_section_widget.dart';
import 'screen_widget.dart';

class SeatLayoutWidget extends StatelessWidget {
  final Screen screen;

  final Function(String seatId)? onSeatTap;

  const SeatLayoutWidget({super.key, required this.screen, this.onSeatTap});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      constrained: false,

      minScale: 0.8,
      maxScale: 3,

      boundaryMargin: const EdgeInsets.all(500),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            ...screen.sections.map(
              (section) =>
                  SeatSectionWidget(section: section, onSeatTap: onSeatTap),
            ),

            const SizedBox(height: 30),

            const ScreenWidget(),
          ],
        ),
      ),
    );
  }
}
