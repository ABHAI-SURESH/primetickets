import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieMetaInfo extends StatelessWidget {
  final String certificate;
  final String language;
  final String duration;
  final DateTime releaseDate;

  MovieMetaInfo({
    super.key,
    required this.certificate,
    required this.language,
    required this.duration,
    required this.releaseDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _capsule(certificate),
        const SizedBox(width: 8),

        _capsule(language),
        const SizedBox(width: 8),

        _capsule(duration),
        const Spacer(),

        _capsule(DateFormat('dd MMM yyyy').format(releaseDate)),
      ],
    );
  }

  /// CAPSULE UI
  Widget _capsule(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
