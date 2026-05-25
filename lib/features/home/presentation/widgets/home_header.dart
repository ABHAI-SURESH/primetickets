import 'package:flutter/material.dart';
import 'package:prime_tickets/features/bookmarks/presentation/pages/bookmarks_page.dart';

class HomeHeader extends StatelessWidget {
  final String currentCity;
  final VoidCallback onTapLocation;

  const HomeHeader({
    super.key,
    required this.currentCity,
    required this.onTapLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///LOCATION SECTION
        GestureDetector(
          onTap: onTapLocation, //controlled by HomePage
          child: Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 22,
                color: Colors.black,
              ),

              const SizedBox(width: 10),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Current Location',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 2),

                  Row(
                    children: [
                      Text(
                        currentCity,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Transform.translate(
                        offset: const Offset(0, 2),
                        child: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        /// BOOKMARK BUTTON
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const BookmarkPage()),
            );
          },
          child: Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.bookmark_border,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
