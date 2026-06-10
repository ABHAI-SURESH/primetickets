import 'package:flutter/material.dart';
import 'package:prime_tickets/features/seat_selection/presentation/widgets/seat_layout_constants.dart';

import '../../domain/models/screen.dart';
import 'row_label_widget.dart';

class StickyRowLabelsWidget extends StatelessWidget {
  final Screen screen;
  final double widestRowWidth;

  final double scale;

  final double translateY;

  const StickyRowLabelsWidget({
    super.key,
    required this.screen,
    required this.widestRowWidth,
    required this.scale,
    required this.translateY,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Transform(
        alignment: Alignment.topCenter,

        transform: Matrix4.identity()
          ..translate(0.0, translateY)
          ..scale(scale),

        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              for (final section in screen.sections) ...[
                const SizedBox(height: SeatLayoutConstants.sectionTopSpacing),

                /// Invisible title placeholder
                Opacity(
                  opacity: 0,
                  child: Text(
                    section.category.name[0],

                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 4),

                SizedBox(
                  width: widestRowWidth,
                  child: const Divider(color: Colors.transparent),
                ),

                const SizedBox(
                  height: SeatLayoutConstants.sectionTitleBottomSpacing,
                ),

                ...section.rows.map(
                  (row) => RowLabelWidget(rowLabel: row.rowLabel),
                ),

                const SizedBox(
                  height: SeatLayoutConstants.sectionBottomSpacing,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
