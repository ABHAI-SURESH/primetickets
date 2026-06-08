import 'package:flutter/material.dart';

import 'seat_layout_constants.dart';

class RowLabelWidget extends StatelessWidget {
  final String rowLabel;

  const RowLabelWidget({super.key, required this.rowLabel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: SeatLayoutConstants.rowVerticalPadding,
      ),

      child: SizedBox(
        height: SeatLayoutConstants.seatSize,

        child: Center(
          child: Text(
            rowLabel,

            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
