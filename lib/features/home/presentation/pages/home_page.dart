import 'package:flutter/material.dart';
import 'package:prime_tickets/features/home/presentation/widgets/theatre_nearby_banner.dart';
import 'package:prime_tickets/features/theatre/presentation/pages/theatre_page.dart';

import '../widgets/home_header.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/movie_carousel.dart';
import '../widgets/movie_horizontal_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FB),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),

                    HomeHeader(),

                    SizedBox(height: 20),

                    HomeSearchBar(),

                    SizedBox(height: 20),

                    Text(
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
              MovieCarousel(),

              SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
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

              SizedBox(height: 15),

              MovieHorizontalList(),

              SizedBox(height: 55),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
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
              SizedBox(height: 15),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TheatreNearbyBanner(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TheatrePage()),
                    );
                  },
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
