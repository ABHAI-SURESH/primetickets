import 'package:flutter/material.dart';
import 'package:prime_tickets/features/seat_selection/data/dummy_screens.dart';
import 'package:prime_tickets/features/seat_selection/domain/models/screen.dart';
import 'package:prime_tickets/features/seat_selection/domain/models/seat_status.dart';

import 'package:prime_tickets/features/seat_selection/presentation/widgets/booking_info_bar.dart';
import 'package:prime_tickets/features/seat_selection/presentation/widgets/seat_count_bottom_sheet.dart';
import 'package:prime_tickets/features/seat_selection/presentation/widgets/seat_indicator.dart';
import 'package:prime_tickets/features/seat_selection/presentation/widgets/seat_layout_widget.dart';
import 'package:prime_tickets/features/seat_selection/presentation/widgets/seat_selection_header.dart';
import 'package:prime_tickets/features/seat_selection/data/dummy_shows.dart';
import 'package:prime_tickets/features/movies/data/dummy_movies.dart';
import 'package:prime_tickets/features/seat_selection/presentation/widgets/showtime_selector.dart';
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

  late List<Show> availableShows;

  late Screen selectedScreen;

  List<String> selectedSeatIds = [];

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

    availableShows = dummyShows
        .where(
          (show) =>
              show.movieId == selectedShow.movieId &&
              show.theatreId == selectedShow.theatreId &&
              show.date.day == selectedShow.date.day &&
              show.date.month == selectedShow.date.month &&
              show.date.year == selectedShow.date.year,
        )
        .toList();

    selectedScreen = dummyScreens.firstWhere(
      (screen) => screen.id == selectedShow.screenId,
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
            // Clear old selected seats
            for (final section in selectedScreen.sections) {
              for (final row in section.rows) {
                for (final cell in row.cells) {
                  if (cell.seat?.status == SeatStatus.selected) {
                    cell.seat!.status = SeatStatus.available;
                  }
                }
              }
            }

            selectedSeatIds.clear();

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

            ShowtimeSelector(
              shows: availableShows,
              selectedShowId: selectedShow.id,
              onShowSelected: (show) {
                // Clear previous selected seats
                for (final section in selectedScreen.sections) {
                  for (final row in section.rows) {
                    for (final cell in row.cells) {
                      if (cell.seat?.status == SeatStatus.selected) {
                        cell.seat!.status = SeatStatus.available;
                      }
                    }
                  }
                }

                setState(() {
                  selectedShow = show;

                  selectedScreen = dummyScreens.firstWhere(
                    (screen) => screen.id == show.screenId,
                  );

                  selectedSeatIds.clear();
                });
              },
            ),

            ///SEAT LAYOUT
            Expanded(
              child: SeatLayoutWidget(
                screen: selectedScreen,
                onSeatTap: onSeatTapped,
              ),
            ),

            ///SEAT INDICATOR
            const SeatIndicator(),
          ],
        ),
      ),
    );
  }

  void onSeatTapped(String seatId) {
    for (final section in selectedScreen.sections) {
      for (final row in section.rows) {
        final seatCells = row.cells.where((cell) => cell.seat != null).toList();

        final tappedIndex = seatCells.indexWhere(
          (cell) => cell.seat!.id == seatId,
        );

        if (tappedIndex == -1) continue;

        /// Not enough seats remaining in row
        if (tappedIndex + selectedSeatCount > seatCells.length) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Not enough seats available in this row.'),
            ),
          );
          return;
        }

        /// Check consecutive seats
        bool canSelect = true;

        for (int i = tappedIndex; i < tappedIndex + selectedSeatCount; i++) {
          final seat = seatCells[i].seat!;

          if (seat.status == SeatStatus.booked) {
            canSelect = false;
            break;
          }
        }

        if (!canSelect) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Unable to find consecutive available seats.'),
            ),
          );
          return;
        }

        /// Clear old selection
        for (final id in selectedSeatIds) {
          for (final sec in selectedScreen.sections) {
            for (final r in sec.rows) {
              for (final cell in r.cells) {
                if (cell.seat?.id == id) {
                  cell.seat!.status = SeatStatus.available;
                }
              }
            }
          }
        }

        selectedSeatIds.clear();

        /// Select new seats
        for (int i = tappedIndex; i < tappedIndex + selectedSeatCount; i++) {
          final seat = seatCells[i].seat!;

          seat.status = SeatStatus.selected;

          selectedSeatIds.add(seat.id);
        }

        setState(() {});

        return;
      }
    }
  }
}
