import 'package:prime_tickets/features/seat_selection/domain/models/seat_category.dart';
import 'package:prime_tickets/features/seat_selection/domain/models/seat_row.dart';

class SeatSection {
  final SeatCategory category;

  final List<SeatRow> rows;

  const SeatSection({required this.category, required this.rows});
}
