import 'package:flutter/material.dart';
import '../../domain/models/city.dart';

class PopularCityGrid extends StatelessWidget {
  final List<City> cities;
  final Function(String) onSelect;

  const PopularCityGrid({
    super.key,
    required this.cities,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.9,
      ),

      itemCount: cities.length,

      itemBuilder: (context, index) {
        final city = cities[index];

        return GestureDetector(
          onTap: () => onSelect(city.name),

          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(city.image, height: 40),
                const SizedBox(height: 10),
                Text(city.name),
              ],
            ),
          ),
        );
      },
    );
  }
}
