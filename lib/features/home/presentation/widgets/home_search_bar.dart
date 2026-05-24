import 'package:flutter/material.dart';

import '../../../search/presentation/pages/search_page.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SearchPage()),
        );
      },

      child: Container(
        height: 50,

        padding: const EdgeInsets.symmetric(horizontal: 16),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(18),

          border: Border.all(color: Colors.grey.shade300),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),

              blurRadius: 12,

              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Row(
          children: const [
            Icon(Icons.search, size: 20, color: Colors.grey),

            SizedBox(width: 12),

            Text(
              'Search movies, theatres...',

              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
