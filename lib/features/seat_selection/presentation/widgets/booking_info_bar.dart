import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingInfoBar extends StatelessWidget {
  final DateTime showDate;

  final int seatCount;

  final VoidCallback onSeatCountTap;

  const BookingInfoBar({
    super.key,
    required this.showDate,
    required this.seatCount,
    required this.onSeatCountTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,

      padding: const EdgeInsets.symmetric(horizontal: 16),

      child: Row(
        children: [
          ///CURRENT DATE
          Text(
            DateFormat('EEE, dd MMM').format(showDate),

            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),

          const Spacer(),

          InkWell(
            onTap: onSeatCountTap,

            borderRadius: BorderRadius.circular(20),

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),

              child: Row(
                children: [
                  const Icon(Icons.event_seat_outlined, size: 18),

                  const SizedBox(width: 6),

                  ///SEAT COUNT
                  Text(
                    '$seatCount Seats',

                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
