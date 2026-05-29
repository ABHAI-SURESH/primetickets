import 'package:flutter/material.dart';
import 'package:prime_tickets/features/movies/data/dummy_movies.dart';
import 'package:prime_tickets/features/theatre/presentation/widgets/showtime_grid.dart';
import 'package:prime_tickets/features/theatre/presentation/widgets/theatre_movie_card.dart';

import '../../domain/models/theatre.dart';
import '../../data/dummy_theatre_shows.dart';

import '../widgets/theatre_header.dart';
import '../widgets/theatre_info_section.dart';
import '../widgets/theatre_details_link.dart';
import '../widgets/date_selector.dart';

class TheatreDetailsPage extends StatefulWidget {
  final Theatre theatre;

  const TheatreDetailsPage({super.key, required this.theatre});

  @override
  State<TheatreDetailsPage> createState() => _TheatreDetailsPageState();
}

class _TheatreDetailsPageState extends State<TheatreDetailsPage> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();

    selectedDate = DateTime.now();
  }

  bool isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    /// NEXT 7 DAYS
    final dates = List.generate(7, (index) => today.add(Duration(days: index)));

    /// FILTER SHOWS FOR SELECTED DATE
    final theatreShows = dummyTheatreShows.where((show) {
      return show.theatreId == widget.theatre.id &&
          isSameDate(show.date, selectedDate);
    }).toList();
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: const TheatreHeader(),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// THEATRE INFO
          TheatreInfoSection(
            theatreName: widget.theatre.name,
            place: widget.theatre.place,
            address: widget.theatre.address,
          ),

          const SizedBox(height: 10),

          /// VIEW DETAILS
          TheatreDetailsLink(onTap: () {}),

          const SizedBox(height: 16),

          /// DATE SELECTOR
          DateSelector(
            dates: dates,
            selectedDate: selectedDate,
            onDateSelected: (date) {
              setState(() {
                selectedDate = date;
              });
            },
          ),

          const SizedBox(height: 16),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              itemCount: theatreShows.length,

              itemBuilder: (context, index) {
                final theatreShow = theatreShows[index];

                final movie = dummyMovies.firstWhere(
                  (m) => m.id == theatreShow.movieId,
                );

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    TheatreMovieCard(movie: movie),

                    const SizedBox(height: 16),

                    ShowtimeGrid(shows: theatreShow.showTimes),

                    const SizedBox(height: 24),

                    Divider(color: Colors.grey.shade300),
                  ],
                );
              },
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
