import 'seat.dart';
import 'seat_cell_type.dart';

class SeatCell {
  final SeatCellType type;

  final Seat? seat;

  const SeatCell.seat({required this.seat}) : type = SeatCellType.seat;

  const SeatCell.gap() : type = SeatCellType.gap, seat = null;
}
