import 'package:flutter/material.dart';
import '../../data/dummy_theatres.dart';
import '../widgets/theatre_card.dart';

class TheatrePage extends StatefulWidget {
  const TheatrePage({super.key});

  @override
  State<TheatrePage> createState() => _TheatrePageState();
}

class _TheatrePageState extends State<TheatrePage> {
  List theatres = dummyTheatres; // THEATRE LIST
  List filteredTheatres = [];

  @override
  void initState() {
    super.initState();
    filteredTheatres = theatres;
  }

  void _filterTheatres(String query) {
    final results = theatres.where((theatre) {
      final name = theatre.name.toLowerCase();
      final place = theatre.place.toLowerCase();

      return name.contains(query.toLowerCase()) ||
          place.contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredTheatres = results;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        titleSpacing: 0,
        scrolledUnderElevation: 0,

        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 16),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),

        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text(
            "Cinemas",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),
        ),
      ),

      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// SEARCH BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: _buildSearchBar(),
            ),

            const SizedBox(height: 4),

            /// THEATRE LIST
            Expanded(
              child: filteredTheatres.isEmpty
                  ? const Center(
                      child: Text(
                        "Sorry! No theatres found",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : ListView.separated(
                      itemCount: filteredTheatres.length,
                      padding: const EdgeInsets.all(16),
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final theatre = filteredTheatres[index];
                        return TheatreCard(theatre: theatre);
                      },
                    ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      child: TextField(
        onChanged: _filterTheatres,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12),
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          hintText: "Search by cinema or area",
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
