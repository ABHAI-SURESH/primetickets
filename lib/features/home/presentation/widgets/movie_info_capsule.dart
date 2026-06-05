import 'package:flutter/material.dart';

class MovieInfoCapsule extends StatelessWidget {
  final String text;

  const MovieInfoCapsule({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

      decoration: BoxDecoration(
        color: Colors.grey.shade100,

        borderRadius: BorderRadius.circular(20),

        border: Border.all(color: Colors.grey.shade300),
      ),

      child: Text(
        text,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}
