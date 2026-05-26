import 'package:flutter/material.dart';
import '../../../search/presentation/pages/search_page.dart';

class TheatreHeader extends StatelessWidget implements PreferredSizeWidget {
  const TheatreHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,

      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, size: 16, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),

      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SearchPage()),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.bookmark_border, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }
}
