import 'package:flutter/material.dart';

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
        const SizedBox(height: 16),

        Text(
          '₹${section.category.price.toInt()} '
          '${section.category.name.toUpperCase()}',

          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 12),

        ...section.rows.map(
          (row) => SeatRowWidget(row: row, onSeatTap: onSeatTap),
        ),

        const SizedBox(height: 16),
      ],
    );
  }
}
