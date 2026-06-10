import 'package:flutter/material.dart';

class CityList extends StatelessWidget {
  final List<String> cities;
  final Function(String) onSelect;

  const CityList({super.key, required this.cities, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      itemCount: cities.length,

      itemBuilder: (context, index) {
        final city = cities[index];

        return Column(
          children: [
            Material(
              color: Colors.transparent,

              child: InkWell(
                onTap: () => onSelect(city),

                child: Container(
                  width: double.infinity,

                  padding: const EdgeInsets.symmetric(vertical: 14),

                  alignment: Alignment.centerLeft,

                  child: Text(city),
                ),
              ),
            ),

            if (index != cities.length - 1)
              Divider(color: Colors.grey.shade400, thickness: 1, height: 0),
          ],
        );
      },
    );
  }
}
