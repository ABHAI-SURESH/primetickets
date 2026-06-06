import 'package:prime_tickets/features/seat_selection/domain/models/seat_row.dart';

class Screen {
  final String id;

  final String theatreId;

  final String name;

  final String audioFormat;

  final List<SeatRow> rows;

  const Screen({
    required this.id,
    required this.theatreId,
    required this.name,
    required this.audioFormat,
    required this.rows,
  });
}
