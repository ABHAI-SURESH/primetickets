import 'package:flutter/material.dart';
import 'package:prime_tickets/features/seat_selection/presentation/pages/seat_selection_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:prime_tickets/features/movie_booking/presentaion/widgets/movie_theatre_header.dart';
import 'package:prime_tickets/features/movies/domain/models/movie.dart';
import 'package:prime_tickets/features/theatre/data/dummy_theatres.dart';
import 'package:prime_tickets/features/theatre/data/dummy_theatre_shows.dart';
import 'package:prime_tickets/features/theatre/domain/models/theatre.dart';
import 'package:prime_tickets/features/theatre/presentation/widgets/date_selector.dart';
import 'package:prime_tickets/features/movie_booking/presentaion/widgets/theatre_show_card.dart';

class MovieTheatresPage extends StatefulWidget {
  final Movie movie;

  const MovieTheatresPage({super.key, required this.movie});

  @override
  State<MovieTheatresPage> createState() => _MovieTheatresPageState();
}

class _MovieTheatresPageState extends State<MovieTheatresPage> {
  String currentCity = "Select Location";

  late DateTime selectedDate;

  bool isSearching = false;

  String searchQuery = '';

  @override
  void initState() {
    super.initState();

    selectedDate = DateTime.now();

    _loadCity();
  }

  Future<void> _loadCity() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      currentCity = prefs.getString('selected_city') ?? 'Select Location';
    });
  }

  bool isSameDate(DateTime a, DateTime b) {
    return a.day == b.day && a.month == b.month && a.year == b.year;
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    final dates = List.generate(5, (index) => today.add(Duration(days: index)));

    /// FILTER BY MOVIE + DATE + LOCATION
    final movieShows = dummyTheatreShows.where((show) {
      final theatre = dummyTheatres.firstWhere((t) => t.id == show.theatreId);

      return show.movieId == widget.movie.id &&
          isSameDate(show.date, selectedDate) &&
          theatre.address.toLowerCase().contains(currentCity.toLowerCase());
    }).toList();

    /// FILTER BY SEARCH QUERY
    final filteredShows = movieShows.where((show) {
      final theatre = dummyTheatres.firstWhere((t) => t.id == show.theatreId);

      return theatre.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            /// HEADER
            MovieTheatresHeader(
              movieTitle: widget.movie.title,
              movieLanguages: widget.movie.languages,

              isSearching: isSearching,

              onBack: () {
                Navigator.pop(context);
              },

              onSearchTap: () {
                setState(() {
                  isSearching = true;
                });
              },

              onCloseSearch: () {
                setState(() {
                  isSearching = false;
                  searchQuery = '';
                });
              },

              onSearchChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),

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
            const SizedBox(height: 10),

            /// THEATRE LIST
            Expanded(
              child: filteredShows.isEmpty
                  ? const Center(
                      child: Text(
                        "No theatres found",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 24,
                      ),
                      itemCount: filteredShows.length,

                      itemBuilder: (context, index) {
                        final show = filteredShows[index];

                        final Theatre theatre = dummyTheatres.firstWhere(
                          (t) => t.id == show.theatreId,
                        );

                        return TheatreShowCard(
                          theatre: theatre,
                          theatreShow: show,

                          onShowSelected: (showTime) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    SeatSelectionPage(showId: showTime.showId),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
