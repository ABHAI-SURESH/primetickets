import 'package:flutter/material.dart';

class ScreenWidget extends StatelessWidget {
  const ScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 12),

      child: Column(
        children: [
          Container(
            width: 280,
            height: 18,

            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),

              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(140),
                topRight: Radius.circular(140),
              ),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'LOOK AT ME',

            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
