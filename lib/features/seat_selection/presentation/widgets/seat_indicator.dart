import 'package:flutter/material.dart';
import 'package:prime_tickets/features/seat_selection/domain/models/seat_status.dart';

class SeatIndicator extends StatelessWidget {
  const SeatIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

      // ignore: prefer_const_constructors
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: const [
          _IndicatorItem(status: SeatStatus.available, label: 'Available'),

          SizedBox(width: 24),

          _IndicatorItem(status: SeatStatus.selected, label: 'Selected'),

          SizedBox(width: 24),

          _IndicatorItem(status: SeatStatus.booked, label: 'Sold'),
        ],
      ),
    );
  }
}

class _IndicatorItem extends StatelessWidget {
  final SeatStatus status;
  final String label;

  const _IndicatorItem({required this.status, required this.label});

  @override
  Widget build(BuildContext context) {
    Color fillColor;
    Color borderColor;

    switch (status) {
      case SeatStatus.available:
        fillColor = Colors.white;
        borderColor = Colors.green;
        break;

      case SeatStatus.selected:
        fillColor = Colors.green;
        borderColor = Colors.green;
        break;

      case SeatStatus.booked:
        fillColor = Colors.grey.shade300;
        borderColor = Colors.grey.shade300;
        break;
    }

    return Row(
      children: [
        Container(
          width: 16,
          height: 16,

          decoration: BoxDecoration(
            color: fillColor,

            borderRadius: BorderRadius.circular(4),

            border: Border.all(color: borderColor),
          ),
        ),

        const SizedBox(width: 6),

        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
