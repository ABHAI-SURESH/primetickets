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

class _SeatLayoutWidgetState extends State<SeatLayoutWidget>
    with SingleTickerProviderStateMixin {
  ///MOVEMENT TRACKING VARIABLES
  final TransformationController transformController =
      TransformationController();

  double get currentScale {
    return transformController.value.getMaxScaleOnAxis();
  }

  double get currentTranslateY {
    return transformController.value.storage[13];
  }

  ///ZOOM CONTROL VARIABLES
  late final AnimationController animationController;
  Animation<Matrix4>? matrixAnimation;

  @override
  void initState() {
    super.initState();

    transformController.addListener(() {});

    ///ZOOM ANIMATION CONTROLLER
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    animationController.addListener(() {
      if (matrixAnimation != null) {
        transformController.value = matrixAnimation!.value;
      }
    });
  }

  @override
  void dispose() {
    ///ZOOM ANIMATION DISPOSE
    animationController.dispose();
    transformController.dispose();
    super.dispose();
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

                onInteractionEnd: (_) {
                  _snapZoomIfNeeded();
                },

                constrained: false,

                minScale: 0.7,

                maxScale: 3.0,

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

  ///ZOOM CONTROL FUNCTION

  void _snapZoomIfNeeded() {
    final currentMatrix = transformController.value;

    final currentScale = currentMatrix.getMaxScaleOnAxis();

    double targetScale = currentScale;

    if (currentScale < 0.8) {
      targetScale = 1;
    }

    if (currentScale > 3.0) {
      targetScale = 2.5;
    }

    if (targetScale == currentScale) {
      return;
    }

    final Matrix4 targetMatrix = Matrix4.copy(currentMatrix);

    targetMatrix.scale(targetScale / currentScale);

    matrixAnimation = Matrix4Tween(begin: currentMatrix, end: targetMatrix)
        .animate(
          CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        );

    animationController.forward(from: 0);
  }
}
