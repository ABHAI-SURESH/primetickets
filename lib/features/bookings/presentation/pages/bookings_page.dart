import 'package:flutter/material.dart';

import '../models/booking.dart';
import '../widgets/booking_ticket_card.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Booking> bookings = [
      Booking(
        movieName: 'Dune',
        language: 'English',
        imagePath: 'assets/images/dune.jpg',
        theatreName: 'PVR Trivandrum',
        showDateTime: DateTime.now().add(const Duration(hours: 2)),
        ticketCount: 2,
        seatType: 'Gold',
        seats: ['A1', 'A2'],
      ),

      Booking(
        movieName: 'Spiderman',
        language: 'Malayalam',
        imagePath: 'assets/images/spiderman.jpg',
        theatreName: 'Aries Plex',
        showDateTime: DateTime.now().add(const Duration(days: 1)),
        ticketCount: 3,
        seatType: 'Silver',
        seats: ['B3', 'B4', 'B5'],
      ),
    ];

    /// SORT (NEWEST FIRST)
    bookings.sort((a, b) => b.showDateTime.compareTo(a.showDateTime));

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),

      appBar: AppBar(
        title: const Text('Your Bookings'),
        elevation: 0,
        backgroundColor: const Color(0xFFF8F9FB),
        foregroundColor: Colors.black,
      ),

      body: bookings.isEmpty
          ? const Center(
              child: Text('No bookings yet', style: TextStyle(fontSize: 16)),
            )
          : ListView.builder(
              itemCount: bookings.length + 1,

              itemBuilder: (context, index) {
                if (index == bookings.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),

                    child: Center(
                      child: Text(
                        "You have no more bookings",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  );
                }
                return BookingTicketCard(booking: bookings[index]);
              },
            ),
    );
  }
}
