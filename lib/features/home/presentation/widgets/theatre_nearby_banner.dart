import 'package:flutter/material.dart';

class TheatreNearbyBanner extends StatelessWidget {
  final VoidCallback onTap;

  const TheatreNearbyBanner({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 75,
        width: double.infinity,

        padding: const EdgeInsets.symmetric(horizontal: 14),

        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 239, 239, 244),
          borderRadius: BorderRadius.circular(18),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),

        child: Row(
          children: [
            /// 🔹 TEXT
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'CINEMAS NEAR ME',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Icon(Icons.chevron_right),
                    ],
                  ),

                  const SizedBox(height: 2),

                  Text(
                    'See what’s playing in cinemas nearby',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),

            /// 🔹 IMAGE
            Image.asset(
              'assets/images/theatre_banner.png',
              height: 80,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
