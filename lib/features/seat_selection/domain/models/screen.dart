import 'package:prime_tickets/features/seat_selection/domain/models/seat_section.dart';

class Screen {
  final String id;

  final String theatreId;

  final String name;

  final String audioFormat;

  final List<SeatSection> sections;

  const Screen({
    required this.id,
    required this.theatreId,
    required this.name,
    required this.audioFormat,
    required this.sections,
  });
}
