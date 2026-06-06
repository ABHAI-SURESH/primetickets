import 'package:flutter/material.dart';

import '../widgets/seat_count_bottom_sheet.dart';

class SeatSelectionPage extends StatefulWidget {
  final String showId;

  const SeatSelectionPage({super.key, required this.showId});

  @override
  State<SeatSelectionPage> createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  int selectedSeatCount = 1;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showSeatCountSheet();
    });
  }

  void _showSeatCountSheet() {
    showModalBottomSheet(
      context: context,

      isScrollControlled: true,

      backgroundColor: Colors.transparent,

      builder: (_) {
        return SeatCountBottomSheet(
          initialCount: selectedSeatCount,

          seatType: 'Premium',

          seatPrice: 180,

          onConfirm: (count) {
            setState(() {
              selectedSeatCount = count;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const Text(
                'Seat Selection Page',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 16),

              Text(
                'Selected Seats: $selectedSeatCount',
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: _showSeatCountSheet,

                child: const Text('Edit Seat Count'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
