import 'package:flutter/material.dart';

import '../../domain/models/screen.dart';

import 'seat_grid_widget.dart';
import 'sticky_row_labels_widget.dart';

class SeatLayoutWidget extends StatelessWidget {
  final Screen screen;

  final Function(String seatId)? onSeatTap;

  const SeatLayoutWidget({super.key, required this.screen, this.onSeatTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        /// LABELS
        SizedBox(width: 32, child: StickyRowLabelsWidget(screen: screen)),

        /// SEATS
        Expanded(
          child: InteractiveViewer(
            constrained: false,

            minScale: 1,

            maxScale: 3,

            boundaryMargin: const EdgeInsets.all(500),

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),

              child: SeatGridWidget(screen: screen, onSeatTap: onSeatTap),
            ),
          ),
        ),
      ],
    );
  }
}
