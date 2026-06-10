import 'package:flutter/material.dart';
import 'package:prime_tickets/features/seat_selection/domain/extensions/width_finder.dart';

import '../../domain/models/screen.dart';
import 'seat_section_widget.dart';
import 'screen_widget.dart';

class SeatGridWidget extends StatelessWidget {
  final Screen screen;

  final Function(String seatId)? onSeatTap;

  const SeatGridWidget({super.key, required this.screen, this.onSeatTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      mainAxisSize: MainAxisSize.min,

      children: [
        ...screen.sections.map(
          (section) => SeatSectionWidget(
            section: section,
            widestRowWidth: screen.widestRowWidth,
            onSeatTap: onSeatTap,
          ),
        ),

        const SizedBox(height: 30),

        ScreenWidget(screen: screen),
      ],
    );
  }
}
