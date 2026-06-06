import 'package:prime_tickets/features/seat_selection/domain/models/seat_cell.dart';

class SeatRow {
  final String rowLabel;

  final List<SeatCell> cells;

  const SeatRow({required this.rowLabel, required this.cells});
}
