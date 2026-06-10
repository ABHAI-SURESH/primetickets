import 'package:flutter/material.dart';
import 'package:prime_tickets/features/seat_selection/domain/extensions/width_finder.dart';

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
    final widestRowWidth = widget.screen.widestRowWidth;
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
                  widestRowWidth: widestRowWidth,
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
                  _snapPanIfNeeded();
                },

                constrained: false,

                minScale: 0.7,

                maxScale: 2.0,

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

    if (currentScale > 2.0) {
      targetScale = 2.0;
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

  ///DRAG CONTROL FUNCTION
  void _snapPanIfNeeded() {
    final matrix = transformController.value;

    final x = matrix.storage[12];
    final y = matrix.storage[13];

    double targetX = x;
    double targetY = y;

    /// Viewport size (visible area)
    final viewportWidth = context.size!.width;
    final viewportHeight = context.size!.height;

    /// Actual auditorium size after zoom
    final layoutWidth = _getLayoutWidth() * currentScale;
    final layoutHeight = _getLayoutHeight() * currentScale;

    double minX;
    double maxX;

    double minY;
    double maxY;

    /// HORIZONTAL BOUNDS

    if (layoutWidth <= viewportWidth) {
      minX = 0;
      maxX = 0;
    } else {
      final overflow = layoutWidth - viewportWidth;

      minX = -(overflow + 100);
      maxX = 0;
    }

    /// VERTICAL BOUNDS

    if (layoutHeight <= viewportHeight) {
      minY = 0;
      maxY = 0;
    } else {
      final overflow = layoutHeight - viewportHeight;

      minY = -overflow;
      maxY = 0;
    }

    /// Clamp X

    if (x > maxX) {
      targetX = maxX;
    }

    if (x < minX) {
      targetX = minX;
    }

    /// Clamp Y

    if (y > maxY) {
      targetY = maxY;
    }

    if (y < minY) {
      targetY = minY;
    }

    /// Already inside bounds

    if (targetX == x && targetY == y) {
      return;
    }

    final targetMatrix = Matrix4.copy(matrix);

    targetMatrix.storage[12] = targetX;
    targetMatrix.storage[13] = targetY;

    matrixAnimation = Matrix4Tween(begin: matrix, end: targetMatrix).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    animationController.forward(from: 0);
  }

  ///WIDEST ROW CALCULATOR FUNCTION
  double _getLayoutWidth() {
    int longestRowLength = 0;

    for (final section in widget.screen.sections) {
      for (final row in section.rows) {
        if (row.cells.length > longestRowLength) {
          longestRowLength = row.cells.length;
        }
      }
    }

    return longestRowLength * 24.0;
  }

  double _getLayoutHeight() {
    int totalRows = 0;

    for (final section in widget.screen.sections) {
      totalRows += section.rows.length;
    }

    const rowHeight = 28.0;

    final sectionSpacing = widget.screen.sections.length * 44.0;

    const screenAreaHeight = 80.0;

    return (totalRows * rowHeight) + sectionSpacing + screenAreaHeight;
  }
}
