import 'package:flutter/material.dart';

import 'package:prime_tickets/features/seat_selection/domain/models/seat_row.dart';
import 'seat_cell_widget.dart';

class SeatRowWidget extends StatelessWidget {
  final SeatRow row;

  final Function(String seatId)? onSeatTap;

  const SeatRowWidget({super.key, required this.row, this.onSeatTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),

      ///ROW LABEL
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SizedBox(
            width: 30,

            child: Text(
              row.rowLabel,
              textAlign: TextAlign.center,

              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),

          const SizedBox(width: 12),

          ///SEATS
          Row(
            mainAxisSize: MainAxisSize.min,

            children: row.cells.map((cell) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),

                child: SeatCellWidget(
                  cell: cell,

                  onTap: cell.seat == null
                      ? null
                      : () {
                          onSeatTap?.call(cell.seat!.id);
                        },
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
