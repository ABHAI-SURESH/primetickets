import 'package:flutter/material.dart';

import '../../domain/models/screen.dart';

import 'seat_grid_widget.dart';
import 'sticky_row_labels_widget.dart';

class SeatLayoutWidget extends StatefulWidget {
  final Screen screen;

  final Function(String seatId)? onSeatTap;

  const SeatLayoutWidget({super.key, required this.screen, this.onSeatTap});

  @override
  State<SeatLayoutWidget> createState() => _SeatLayoutWidgetState();
}

class _SeatLayoutWidgetState extends State<SeatLayoutWidget> {
  final TransformationController transformController =
      TransformationController();

  double get currentScale {
    return transformController.value.getMaxScaleOnAxis();
  }

  double get currentTranslateY {
    return transformController.value.storage[13];
  }

  @override
  void initState() {
    super.initState();

    transformController.addListener(() {
      final matrix = transformController.value;

      print('Scale: ${matrix.getMaxScaleOnAxis()}');

      print('X: ${matrix.storage[12]}');

      print('Y: ${matrix.storage[13]}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: transformController,

      builder: (context, child) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            /// LABELS
            ClipRect(
              child: SizedBox(
                width: 38,

                child: StickyRowLabelsWidget(
                  screen: widget.screen,
                  scale: currentScale,
                  translateY: currentTranslateY,
                ),
              ),
            ),

            /// SEATS
            Expanded(
              child: InteractiveViewer(
                transformationController: transformController,

                constrained: false,

                minScale: 1,

                maxScale: 3,

                boundaryMargin: const EdgeInsets.all(500),

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),

                  child: SeatGridWidget(
                    screen: widget.screen,
                    onSeatTap: widget.onSeatTap,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
