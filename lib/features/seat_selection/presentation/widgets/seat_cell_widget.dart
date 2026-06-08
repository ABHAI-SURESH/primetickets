import 'package:flutter/material.dart';

import 'package:prime_tickets/features/seat_selection/domain/models/seat_cell.dart';
import 'package:prime_tickets/features/seat_selection/domain/models/seat_status.dart';
import 'package:prime_tickets/features/seat_selection/presentation/widgets/seat_layout_constants.dart';

class SeatCellWidget extends StatelessWidget {
  final SeatCell cell;

  final VoidCallback? onTap;

  const SeatCellWidget({super.key, required this.cell, this.onTap});

  @override
  Widget build(BuildContext context) {
    // GAP
    if (cell.seat == null) {
      return const SizedBox(
        width: SeatLayoutConstants.seatSize,
        height: SeatLayoutConstants.seatSize,
      );
    }

    final seat = cell.seat!;

    Color borderColor;
    Color backgroundColor;
    Color textColor;

    switch (seat.status) {
      case SeatStatus.available:
        borderColor = Colors.green;
        backgroundColor = Colors.white;
        textColor = Colors.green;
        break;

      case SeatStatus.selected:
        borderColor = Colors.green;
        backgroundColor = Colors.green;
        textColor = Colors.white;
        break;

      case SeatStatus.booked:
        borderColor = Colors.grey;
        backgroundColor = Colors.grey;
        textColor = Colors.white;
        break;
    }

    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: SeatLayoutConstants.seatSize,
        height: SeatLayoutConstants.seatSize,

        decoration: BoxDecoration(
          color: backgroundColor,

          borderRadius: BorderRadius.circular(4),

          border: Border.all(color: borderColor, width: 1.5),
        ),

        alignment: Alignment.center,

        child: Text(
          seat.number.toString(),

          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
