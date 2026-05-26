import 'package:flutter/material.dart';

class TheatreInfoSection extends StatelessWidget {
  final String theatreName;
  final String place;
  final String address;

  const TheatreInfoSection({
    super.key,
    required this.theatreName,
    required this.place,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// NAME
          Text(
            "${theatreName} ${place}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 6),

          /// ADDRESS
          Text(
            address,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
          ),

          const SizedBox(height: 8),

          /// GET DIRECTIONS
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                const Text(
                  "Get directions",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 6),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.grey.shade600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
