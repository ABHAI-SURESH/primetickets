import 'package:flutter/material.dart';

class BookTicketButton extends StatelessWidget {
  final VoidCallback onTap;

  const BookTicketButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.9),
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.1))),
      ),

      child: GestureDetector(
        onTap: onTap,

        child: Container(
          height: 40,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),

            gradient: const LinearGradient(
              colors: [Color(0xFF14B8A6), Color(0xFF0D9488)],
            ),
          ),

          child: const Center(
            child: Text(
              "Book Tickets",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
