import 'package:flutter/material.dart';

class CurrentLocationCard extends StatelessWidget {
  const CurrentLocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),

      child: const Row(
        children: [
          Icon(Icons.my_location),
          SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("Use current location"), Text("Kollayil, India")],
          ),

          Spacer(),
          Icon(Icons.arrow_forward_ios, size: 14),
        ],
      ),
    );
  }
}
