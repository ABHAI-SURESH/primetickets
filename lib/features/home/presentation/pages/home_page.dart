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

class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 70;

  @override
  double get maxExtent => 70;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: const Color(0xFFF8F9FB), // match background

      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),

      child: const HomeSearchBar(),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class _HomePageState extends State<HomePage> {
  String currentCity = "Select Location";

  ///LOCATION FUNCTION
  void _openLocationPage() async {
    if (currentCity == "Select Location") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a location first")),
      );
      return;
    }

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
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            /// HEADER (SCROLLS AWAY)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),

                    HomeHeader(
                      currentCity: currentCity,
                      onTapLocation: _openLocationPage,
                    ),

                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),

            ///STICKY SEARCH BAR
            SliverPersistentHeader(
              pinned: true,
              delegate: _SearchBarDelegate(),
            ),

            ///CONTENT
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (booking != null) ...[
                          BookingTicketCard(booking: booking),
                          const SizedBox(height: 8),
                        ],
                        const Text(
                          'Latest Releases',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
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
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Upcoming Releases',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
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
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Explore',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TheatreNearbyBanner(
                      onTap: () {
                        if (currentCity == "Select Location") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please select a location first"),
                            ),
                          );
                          return;
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                TheatrePage(selectedCity: currentCity),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
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
