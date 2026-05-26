import 'package:flutter/material.dart';

class TheatreDetailsLink extends StatelessWidget {
  final VoidCallback onTap;

  const TheatreDetailsLink({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),

      child: GestureDetector(
        onTap: onTap,
        child: const Text(
          "View theatre details",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
