import 'package:flutter/material.dart';

class MovieFilterBar extends StatelessWidget {
  final List<String> filters;
  final int selectedIndex;
  final Function(int) onTap;

  const MovieFilterBar({
    super.key,
    required this.filters,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,

      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15),

        itemCount: filters.length,

        separatorBuilder: (_, __) => const SizedBox(width: 10),

        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onTap(index),

            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),

              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.transparent,

                borderRadius: BorderRadius.circular(20),

                border: Border.all(
                  color: isSelected ? Colors.black : Colors.grey.shade400,
                ),
              ),

              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// FILTER ICON ONLY FOR FIRST ITEM
                  if (index == 0)
                    const Padding(
                      padding: EdgeInsets.only(right: 6),
                      child: Icon(Icons.tune, size: 16),
                    ),

                  Text(
                    filters[index],
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
