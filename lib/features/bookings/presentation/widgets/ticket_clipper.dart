import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    double notchRadius = 12;

    path.moveTo(0, 0);

    /// TOP LEFT CORNER
    path.quadraticBezierTo(0, 0, 16, 0);

    /// TOP LINE
    path.lineTo(size.width - 16, 0);

    /// TOP RIGHT CORNER
    path.quadraticBezierTo(size.width, 0, size.width, 16);

    /// RIGHT SIDE (TOP TO NOTCH)
    path.lineTo(size.width, size.height / 2 - notchRadius);

    /// RIGHT NOTCH
    path.arcToPoint(
      Offset(size.width, size.height / 2 + notchRadius),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );

    /// RIGHT SIDE (BOTTOM)
    path.lineTo(size.width, size.height - 16);

    /// BOTTOM RIGHT CORNER
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - 16,
      size.height,
    );

    /// BOTTOM LINE
    path.lineTo(16, size.height);

    /// BOTTOM LEFT CORNER
    path.quadraticBezierTo(0, size.height, 0, size.height - 16);

    /// LEFT SIDE (BOTTOM TO NOTCH)
    path.lineTo(0, size.height / 2 + notchRadius);

    /// LEFT NOTCH
    path.arcToPoint(
      Offset(0, size.height / 2 - notchRadius),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );

    /// LEFT SIDE (TOP)
    path.lineTo(0, 16);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
