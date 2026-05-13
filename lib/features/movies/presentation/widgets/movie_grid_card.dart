import 'package:flutter/material.dart';

class MovieGridCard extends StatelessWidget {
  final String imagePath;

  const MovieGridCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),

      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }
}
