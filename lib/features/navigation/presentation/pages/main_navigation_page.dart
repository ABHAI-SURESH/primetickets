import 'package:flutter/material.dart';

import '../../../bookings/presentation/pages/bookings_page.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../movies/presentation/pages/movies_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const MoviesPage(),
    const BookingsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      body: Stack(
        children: [
          ///MAIN CONTENT (FULL SCREEN)
          Positioned.fill(
            child: IndexedStack(index: selectedIndex, children: pages),
          ),

          ///FLOATING NAV BAR
          Positioned(
            left: 10,
            right: 10,
            bottom: 12,

            child: Container(
              height: 55,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  navItem(icon: Icons.home_rounded, label: 'Home', index: 0),

                  navItem(
                    icon: Icons.movie_creation_outlined,
                    label: 'Movies',
                    index: 1,
                  ),

                  navItem(
                    icon: Icons.confirmation_number_outlined,
                    label: 'Bookings',
                    index: 2,
                  ),

                  navItem(
                    icon: Icons.person_outline_rounded,
                    label: 'Profile',
                    index: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget navItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },

      behavior: HitTestBehavior.opaque,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,

          borderRadius: BorderRadius.circular(30),
        ),

        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey,

              size: 22,
            ),

            if (isSelected) ...[
              const SizedBox(width: 8),

              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
