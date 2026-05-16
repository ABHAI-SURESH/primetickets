import 'package:flutter/material.dart';
import '../models/booking.dart';

class BookingTicketCard extends StatelessWidget {
  final Booking booking;

  const BookingTicketCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: Row(
        children: [
          /// 🔹 LEFT POSTER
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(
              booking.imagePath,
              width: 90,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),

          /// 🔹 RIGHT DETAILS
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  /// MOVIE NAME
                  Text(
                    booking.movieName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 4),

                  /// LANGUAGE
                  Text(
                    booking.language,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),

                  const SizedBox(height: 8),

                  /// DATE & TIME
                  Text(
                    "${booking.showDateTime.day}/${booking.showDateTime.month} • ${booking.showDateTime.hour}:${booking.showDateTime.minute.toString().padLeft(2, '0')}",
                    style: const TextStyle(fontSize: 13),
                  ),

                  const SizedBox(height: 4),

                  /// THEATRE
                  Text(
                    booking.theatreName,
                    style: const TextStyle(fontSize: 13),
                  ),

                  const SizedBox(height: 6),

                  /// TICKETS + SEATS
                  Text(
                    "${booking.ticketCount} Tickets • ${booking.seatType} • ${booking.seats.join(', ')}",
                    style: const TextStyle(fontSize: 12, color: Colors.black87),
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
