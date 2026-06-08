import 'package:flutter/material.dart';
import 'package:prime_tickets/features/seat_selection/presentation/widgets/seat_layout_constants.dart';

import '../../domain/models/screen.dart';

class StickyRowLabelsWidget extends StatelessWidget {
  final Screen screen;

  const StickyRowLabelsWidget({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final section in screen.sections) ...[
          const SizedBox(
            height:
                SeatLayoutConstants.sectionTopSpacing +
                16 + // approximate title height
                SeatLayoutConstants.sectionTitleBottomSpacing,
          ),

          for (final row in section.rows)
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: SeatLayoutConstants.rowVerticalPadding,
              ),

              child: SizedBox(
                height: SeatLayoutConstants.rowHeight,

                child: Center(
                  child: Text(
                    row.rowLabel,

                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

          const SizedBox(height: SeatLayoutConstants.sectionBottomSpacing),
        ],
      ],
    );
  }
}
