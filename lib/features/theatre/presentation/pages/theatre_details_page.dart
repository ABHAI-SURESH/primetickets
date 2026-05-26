import 'package:flutter/material.dart';
import '../../domain/models/theatre.dart';
import '../widgets/theatre_header.dart';
import '../widgets/theatre_info_section.dart';
import '../widgets/theatre_details_link.dart';
import '../widgets/facilities_section.dart';

class TheatreDetailsPage extends StatelessWidget {
  final Theatre theatre;

  const TheatreDetailsPage({super.key, required this.theatre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: const TheatreHeader(),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// THEATRE INFO
          TheatreInfoSection(
            theatreName: theatre.name,
            place: theatre.place,
            address: theatre.address,
          ),

          const SizedBox(height: 10),

          /// VIEW DETAILS
          TheatreDetailsLink(onTap: () {}),

          const SizedBox(height: 16),

          /// FACILITIES
          FacilitiesSection(facilities: theatre.facilities),
        ],
      ),
    );
  }
}
