import 'package:flutter/material.dart';

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

      body: SingleChildScrollView(
        child: Column(
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

            /// TEMPORARY CHECK
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Movies found: ${theatreShows.length}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
