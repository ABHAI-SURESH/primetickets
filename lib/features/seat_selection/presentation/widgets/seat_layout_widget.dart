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
  // ─── TRANSFORMATION TRACKING ───────────────────────────────────────────────
  final TransformationController _transformController =
      TransformationController();

  double get _currentScale => _transformController.value.getMaxScaleOnAxis();

  /// Raw vertical translation from the transformation matrix.
  double get _currentTranslateY => _transformController.value.storage[13];

  // ─── ZOOM ANIMATION ────────────────────────────────────────────────────────
  late final AnimationController _animationController;
  Animation<Matrix4>? _matrixAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _animationController.addListener(() {
      if (_matrixAnimation != null) {
        _transformController.value = _matrixAnimation!.value;
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _transformController.dispose();
    super.dispose();
  }

  // ─── BUILD ─────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final widestRowWidth = widget.screen.widestRowWidth;

    return AnimatedBuilder(
      animation: _transformController,
      builder: (context, _) {
        return Stack(
          children: [
            // ── SEAT CANVAS ─────────────────────────────────────────────────
            // InteractiveViewer fills the full area; constrained: false lets
            // content grow beyond the viewport naturally.
            Positioned.fill(
              child: InteractiveViewer(
                transformationController: _transformController,
                onInteractionEnd: (_) {
                  _snapZoomIfNeeded();
                  _snapPanIfNeeded();
                },
                constrained: false,
                minScale: 0.7,
                maxScale: 2.0,
                // Large boundary margin so panning feels free before snap-back.
                boundaryMargin: const EdgeInsets.all(500),
                child: Padding(
                  // Left padding of 38 offsets the seat canvas by the label
                  // column width so seats start to the right of the labels.
                  padding: const EdgeInsets.only(
                    left: 38,
                    right: 16,
                    top: 20,
                    bottom: 20,
                  ),
                  child: SeatGridWidget(
                    screen: widget.screen,
                    onSeatTap: widget.onSeatTap,
                  ),
                ),
              ),
            ),

            // ── PINNED LABEL OVERLAY ─────────────────────────────────────────
            // Anchored at left: 0, spans full viewport height.
            // OverflowBox inside allows the label column to exceed clip height.
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: 38,
              child: StickyRowLabelsWidget(
                screen: widget.screen,
                widestRowWidth: widestRowWidth,
                scale: _currentScale,
                translateY: _currentTranslateY,
              ),
            ),
          ],
        );
      },
    );
  }

  // ─── SNAP ZOOM ─────────────────────────────────────────────────────────────
  void _snapZoomIfNeeded() {
    final currentMatrix = _transformController.value;
    final currentScale = currentMatrix.getMaxScaleOnAxis();

    double targetScale = currentScale;

    if (currentScale < 0.8) targetScale = 1.0;
    if (currentScale > 2.0) targetScale = 2.0;

    if (targetScale == currentScale) return;

    final targetMatrix = Matrix4.copy(currentMatrix)
      ..scale(targetScale / currentScale);

    _matrixAnimation = Matrix4Tween(begin: currentMatrix, end: targetMatrix)
        .animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    _animationController.forward(from: 0);
  }

  // ─── SNAP PAN ──────────────────────────────────────────────────────────────
  void _snapPanIfNeeded() {
    final matrix = _transformController.value;
    final x = matrix.storage[12];
    final y = matrix.storage[13];

    double targetX = x;
    double targetY = y;

    final viewportWidth = context.size!.width;
    final viewportHeight = context.size!.height;

    final scale = _currentScale;
    final layoutWidth = _getLayoutWidth() * scale;
    final layoutHeight = _getLayoutHeight() * scale;

    // HORIZONTAL — account for 38px pinned label track on the left
    const labelTrackWidth = 38.0;
    final effectiveViewportWidth = viewportWidth - labelTrackWidth;

    final double minX;
    final double maxX;

    if (layoutWidth <= effectiveViewportWidth) {
      minX = 0;
      maxX = 0;
    } else {
      final overflow = layoutWidth - effectiveViewportWidth;
      minX = -(overflow + 100); // 100px elastic buffer before snap
      maxX = 0;
    }

    // VERTICAL
    final double minY;
    final double maxY;

    if (layoutHeight <= viewportHeight) {
      minY = 0;
      maxY = 0;
    } else {
      final overflow = layoutHeight - viewportHeight;
      minY = -overflow;
      maxY = 0;
    }

    if (x > maxX) targetX = maxX;
    if (x < minX) targetX = minX;
    if (y > maxY) targetY = maxY;
    if (y < minY) targetY = minY;

    if (targetX == x && targetY == y) return;

    final targetMatrix = Matrix4.copy(matrix);
    targetMatrix.storage[12] = targetX;
    targetMatrix.storage[13] = targetY;

    _matrixAnimation = Matrix4Tween(begin: matrix, end: targetMatrix).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward(from: 0);
  }

  // ─── LAYOUT SIZE CALCULATORS ───────────────────────────────────────────────
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
