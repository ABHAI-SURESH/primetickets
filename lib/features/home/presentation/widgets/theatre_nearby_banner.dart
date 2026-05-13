import 'package:flutter/material.dart';

class TheatreNearbyBanner extends StatelessWidget {
  final VoidCallback onTap;

  const TheatreNearbyBanner({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 100,
        width: double.infinity,

        padding: const EdgeInsets.symmetric(horizontal: 20),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Row(
          children: [
            /// LEFT TEXT
            Expanded(
              child: Text(
                'Theatres\nnear me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                ),
              ),
            ),

            /// RIGHT IMAGE
            Image.asset(
              'assets/images/projector.jpg', // replace with your asset
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
