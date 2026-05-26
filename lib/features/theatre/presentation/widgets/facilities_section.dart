import 'package:flutter/material.dart';
import 'package:prime_tickets/core/facility_config.dart';

class FacilitiesSection extends StatelessWidget {
  final List<String> facilities;

  const FacilitiesSection({super.key, required this.facilities});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// TITLE
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Text(
            "Available facilities",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),

        const SizedBox(height: 20),

        /// LIST
        SizedBox(
          height: 100,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            itemCount: facilities.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),

            itemBuilder: (context, index) {
              final key = facilities[index];
              final data = facilityConfig[key]!;

              return SizedBox(
                width: 80,
                child: Column(
                  children: [
                    Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Icon(data["icon"], size: 22, color: Colors.black),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      data["label"],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
