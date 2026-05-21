import 'package:flutter/material.dart';

class MovieBookingInfo extends StatelessWidget {
  final int bookedCount;

  const MovieBookingInfo({super.key, required this.bookedCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15), // 🔥 glass look
        borderRadius: BorderRadius.circular(30),

        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),

      child: Text(
        "$bookedCount tickets booked today",
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
