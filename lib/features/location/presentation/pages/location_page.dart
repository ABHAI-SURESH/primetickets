import 'package:flutter/material.dart';
import 'package:prime_tickets/features/location/data/dummy_cities.dart';
import 'package:prime_tickets/features/location/presentation/widgets/city_list.dart';
import 'package:prime_tickets/features/location/presentation/widgets/current_location_card.dart';
import 'package:prime_tickets/features/location/presentation/widgets/popular_city_grid.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  List<String> filteredCities = allCities;

  void _filterCities(String query) {
    final results = allCities
        .where((city) => city.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      filteredCities = results;
    });
  }

  void _selectCity(String city) {
    Navigator.pop(context, city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),

        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,

          titleSpacing: 0,

          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Location",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),

          ///SEARCH BAR INSIDE APPBAR
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),

            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),

              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey.shade300),
                ),

                child: TextField(
                  onChanged: _filterCities,

                  decoration: const InputDecoration(
                    hintText: "Search city, area or locality",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),

      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///CURRENT LOCATION CARD
                CurrentLocationCard(),

                const SizedBox(height: 20),

                const Text(
                  "Popular cities",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),

                const SizedBox(height: 10),

                ///POPULAR CITY GRID
                PopularCityGrid(cities: popularCities, onSelect: _selectCity),

                const SizedBox(height: 20),

                const Text(
                  "All cities",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),

                ///CITY LIST
                CityList(cities: allCities, onSelect: _selectCity),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
