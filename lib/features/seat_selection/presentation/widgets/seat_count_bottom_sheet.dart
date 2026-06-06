import 'package:flutter/material.dart';

class SeatCountBottomSheet extends StatefulWidget {
  final int initialCount;

  final String seatType;

  final double seatPrice;

  final Function(int) onConfirm;

  const SeatCountBottomSheet({
    super.key,
    required this.initialCount,
    required this.seatType,
    required this.seatPrice,
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

      padding: const EdgeInsets.all(24),

      decoration: const BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),

      child: Column(
        children: [
          const Text(
            'How many seats?',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 24),

          /// IMAGE PLACEHOLDER
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

            child: ListView.separated(
              scrollDirection: Axis.horizontal,

              itemCount: 10,

              separatorBuilder: (_, __) => const SizedBox(width: 8),

              itemBuilder: (context, index) {
                final count = index + 1;

                final isSelected = selectedCount == count;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCount = count;
                    });
                  },

                  child: Container(
                    width: 28,
                    height: 38,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      border: Border.all(
                        color: isSelected ? Colors.black : Colors.grey.shade400,
                        width: 2,
                      ),
                    ),

                    child: Center(
                      child: Text(
                        count.toString(),

                        style: TextStyle(
                          fontWeight: FontWeight.w600,

                          color: isSelected ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          Text(
            '${widget.seatType} • ₹${widget.seatPrice.toInt()}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
