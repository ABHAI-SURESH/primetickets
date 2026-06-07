import 'package:flutter/material.dart';

class SeatBookingSummaryBar extends StatelessWidget {
  final List<String> selectedSeats;

  final double totalPrice;

  final VoidCallback onProceed;

  const SeatBookingSummaryBar({
    super.key,
    required this.selectedSeats,
    required this.totalPrice,
    required this.onProceed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: const BoxDecoration(
        color: Colors.white,

        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(0, -2),
            color: Color(0x14000000),
          ),
        ],
      ),

      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisSize: MainAxisSize.min,

              children: [
                Text(
                  '${selectedSeats.length} Seat${selectedSeats.length > 1 ? 's' : ''}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  selectedSeats.join(', '),

                  maxLines: 1,

                  overflow: TextOverflow.ellipsis,

                  style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                ),

                const SizedBox(height: 4),

                Text(
                  '₹${totalPrice.toInt()}',

                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          SizedBox(
            height: 46,

            child: ElevatedButton(
              onPressed: onProceed,

              child: const Text('Proceed'),
            ),
          ),
        ],
      ),
    );
  }
}
