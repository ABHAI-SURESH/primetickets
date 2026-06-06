import 'package:flutter/material.dart';

import 'package:prime_tickets/features/seat_selection/presentation/widgets/booking_info_bar.dart';
import 'package:prime_tickets/features/seat_selection/presentation/widgets/seat_count_bottom_sheet.dart';
import 'package:prime_tickets/features/seat_selection/presentation/widgets/seat_selection_header.dart';
import 'package:prime_tickets/features/seat_selection/data/dummy_shows.dart';
import 'package:prime_tickets/features/movies/data/dummy_movies.dart';
import 'package:prime_tickets/features/theatre/data/dummy_theatres.dart';

import 'package:prime_tickets/features/seat_selection/domain/models/show.dart';
import 'package:prime_tickets/features/movies/domain/models/movie.dart';
import 'package:prime_tickets/features/theatre/domain/models/theatre.dart';

class SeatSelectionPage extends StatefulWidget {
  final String showId;

  const SeatSelectionPage({super.key, required this.showId});

  @override
  State<SeatSelectionPage> createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  int selectedSeatCount = 1;
  late Show selectedShow;
  late Movie selectedMovie;
  late Theatre selectedTheatre;

  @override
  void initState() {
    super.initState();

    selectedShow = dummyShows.firstWhere((show) => show.id == widget.showId);

    selectedMovie = dummyMovies.firstWhere(
      (movie) => movie.id == selectedShow.movieId,
    );

    selectedTheatre = dummyTheatres.firstWhere(
      (theatre) => theatre.id == selectedShow.theatreId,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showSeatCountSheet();
    });
  }

  void _showSeatCountSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,

      builder: (_) {
        return SeatCountBottomSheet(
          initialCount: selectedSeatCount,

          seatType: 'Premium',

          seatPrice: 180,

          onConfirm: (count) {
            setState(() {
              selectedSeatCount = count;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            /// HEADER
            SeatSelectionHeader(
              movieTitle: selectedMovie.title,
              theatreName: '${selectedTheatre.name}, ${selectedTheatre.place}',

              onBack: () {
                Navigator.pop(context);
              },
            ),

            /// DATE + TICKET COUNT
            BookingInfoBar(
              showDate: selectedShow.date,

              seatCount: selectedSeatCount,

              onSeatCountTap: () {
                _showSeatCountSheet();
              },
            ),

            const Divider(height: 1),

            /// TEMP PLACEHOLDER
            Expanded(
              child: Center(
                child: Text(
                  'Selected Seats: $selectedSeatCount',

                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
