import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:prime_tickets/features/location/presentation/pages/location_page.dart';
import 'package:prime_tickets/features/bookings/data/dummy_booking.dart';
import 'package:prime_tickets/features/bookings/presentation/models/booking.dart';
import 'package:prime_tickets/features/bookings/presentation/widgets/booking_ticket_card.dart';
import 'package:prime_tickets/features/home/presentation/widgets/theatre_nearby_banner.dart';
import 'package:prime_tickets/features/theatre/presentation/pages/theatre_page.dart';

import 'package:prime_tickets/features/home/presentation/widgets/home_header.dart';
import 'package:prime_tickets/features/home/presentation/widgets/home_search_bar.dart';
import 'package:prime_tickets/features/home/presentation/widgets/movie_carousel.dart';
import 'package:prime_tickets/features/home/presentation/widgets/movie_horizontal_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentCity = "Select Location";

  ///LOCATION FUNCTION
  void _openLocationPage() async {
    final selectedCity = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const LocationPage()),
    );

    if (selectedCity != null) {
      setState(() {
        currentCity = selectedCity;
      });

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('selected_city', selectedCity);
    }
  }

  Booking? getLatestActiveBooking(List<Booking> bookings) {
    final now = DateTime.now();

    final activeBookings = bookings
        .where((b) => b.showDateTime.isAfter(now))
        .toList();

    if (activeBookings.isEmpty) return null;

    activeBookings.sort((a, b) => a.showDateTime.compareTo(b.showDateTime));

    return activeBookings.first;
  }

  @override
  Widget build(BuildContext context) {
    final booking = getLatestActiveBooking(dummyBookings);
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),

                    HomeHeader(
                      currentCity: currentCity,
                      onTapLocation: _openLocationPage,
                    ),

                    const SizedBox(height: 20),

                    const HomeSearchBar(),

                    const SizedBox(height: 8),

                    ///SHOW ONLY IF EXISTS
                    if (booking != null) ...[
                      BookingTicketCard(booking: booking),

                      const SizedBox(height: 8),
                    ],

                    const Text(
                      'Latest Releases',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const MovieCarousel(),

              const SizedBox(height: 15),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'Upcoming Releases',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              const MovieHorizontalList(),

              const SizedBox(height: 55),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'Explore',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TheatreNearbyBanner(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TheatrePage()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadSavedCity();
  }

  void _loadSavedCity() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCity = prefs.getString('selected_city');

    if (savedCity != null) {
      setState(() {
        currentCity = savedCity;
      });
    }
  }
}
