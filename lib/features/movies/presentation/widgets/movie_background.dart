import 'dart:ui';
import 'package:flutter/material.dart';

class MovieBackground extends StatelessWidget {
  final String imagePath;

  const MovieBackground({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// 🔹 ORIGINAL IMAGE
        Positioned.fill(child: Image.asset(imagePath, fit: BoxFit.cover)),

        /// 🔹 BLUR EFFECT
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(color: Colors.black.withOpacity(0.45)),
          ),
        ),

        /// 🔹 OPTIONAL GRADIENT (DEPTH)
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
