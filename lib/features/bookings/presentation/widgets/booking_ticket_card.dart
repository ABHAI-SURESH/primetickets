import 'package:flutter/material.dart';
import 'ticket_border_painter.dart';
import '../models/booking.dart';
import 'ticket_clipper.dart';

class BookingTicketCard extends StatelessWidget {
  final Booking booking;

  const BookingTicketCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

      child: CustomPaint(
        painter: TicketBorderPainter(),
        child: ClipPath(
          clipper: TicketClipper(),

          child: Container(
            height: 150,
            color: Colors.white,

            child: Row(
              children: [
                ///LEFT POSTER
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      booking.imagePath,
                      width: 80,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                /// 🔹 DASHED DIVIDER (TEAR LINE)
                SizedBox(
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      10,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        width: 1,
                        height: 6,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),

                /// 🔹 RIGHT DETAILS
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        /// MOVIE NAME
                        Text(
                          booking.movieName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(height: 4),

                        /// LANGUAGE
                        Text(
                          booking.language,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
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
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
