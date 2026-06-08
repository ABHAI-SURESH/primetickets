import 'package:flutter/material.dart';
import 'package:prime_tickets/features/seat_selection/presentation/widgets/seat_layout_constants.dart';

import '../../domain/models/seat_section.dart';
import 'seat_row_widget.dart';

class SeatSectionWidget extends StatelessWidget {
  final SeatSection section;

  final Function(String seatId)? onSeatTap;

  const SeatSectionWidget({super.key, required this.section, this.onSeatTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const SizedBox(height: SeatLayoutConstants.sectionTopSpacing),

        Text(
          '₹${section.category.price.toInt()} '
          '${section.category.name.toUpperCase()}',

          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: SeatLayoutConstants.sectionTitleBottomSpacing),

        ...section.rows.map(
          (row) => SeatRowWidget(row: row, onSeatTap: onSeatTap),
        ),

        const SizedBox(height: SeatLayoutConstants.sectionBottomSpacing),
      ],
    );
  }
}
