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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: onProceed,
        child: Container(
          width: double.infinity,
          height: 52,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 134, 214, 170),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              'Pay ₹${totalPrice.toInt()}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
