import 'package:flutter/material.dart';

class AlphabetSidebar extends StatelessWidget {
  const AlphabetSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 120,
      bottom: 0,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(26, (index) {
          final letter = String.fromCharCode(65 + index);

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(letter, style: const TextStyle(fontSize: 10)),
          );
        }),
      ),
    );
  }
}
