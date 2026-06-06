import 'package:flutter/material.dart';
import 'package:prime_tickets/features/theatre/domain/models/theatre.dart';
import 'package:prime_tickets/features/theatre/presentation/pages/theatre_details_showtime_page.dart';

class TheatreCard extends StatelessWidget {
  final Theatre theatre;

  const TheatreCard({super.key, required this.theatre});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TheatreDetailsPage(theatre: theatre),
          ),
        );
      },

      child: Container(
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
        ),

        child: Row(
          children: [
            /// TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${theatre.name} : ${theatre.place}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "${theatre.address} ${theatre.pincode}, ${theatre.country}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                ],
              ),
            ),

            /// ARROW
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
