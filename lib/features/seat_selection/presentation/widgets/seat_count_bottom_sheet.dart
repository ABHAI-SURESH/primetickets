import 'package:flutter/material.dart';
import 'package:prime_tickets/features/seat_selection/domain/models/seat_category.dart';

class SeatCountBottomSheet extends StatefulWidget {
  final int initialCount;
  final List<SeatCategory> categories;

  final Function(int) onConfirm;

  const SeatCountBottomSheet({
    super.key,
    required this.initialCount,
    required this.categories,

    required this.onConfirm,
  });

  @override
  State<SeatCountBottomSheet> createState() => _SeatCountBottomSheetState();
}

class _SeatCountBottomSheetState extends State<SeatCountBottomSheet> {
  late int selectedCount;

  @override
  void initState() {
    super.initState();
    selectedCount = widget.initialCount;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 22),
          const Text(
            'How many seats?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),

          const SizedBox(height: 24),

          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.movie, size: 40),
          ),

          const SizedBox(height: 24),

          SizedBox(
            height: 50,
            child: Row(
              children: List.generate(10, (index) {
                final count = index + 1;
                final isSelected = selectedCount == count;

                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCount = count;
                      });
                    },
                    child: Center(
                      child: Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected ? Colors.black : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            count.toString(),
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: isSelected ? Colors.white : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 16),

          Row(
            children: widget.categories.map((category) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        category.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '₹${category.price.toInt()}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),

          const Spacer(),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                widget.onConfirm(selectedCount);
                Navigator.pop(context);
              },
              child: const Text('Select Seats'),
            ),
          ),
        ],
      ),
    );
  }
}
