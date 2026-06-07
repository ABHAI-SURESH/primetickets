import '../domain/models/seat.dart';
import '../domain/models/seat_cell.dart';
import '../domain/models/seat_row.dart';
import '../domain/models/seat_status.dart';
import '../domain/models/seat_gap.dart';

class SeatLayoutBuilder {
  static SeatRow buildRow({
    required String rowLabel,
    required List<dynamic> pattern,
    List<String> bookedSeats = const [],
  }) {
    final List<SeatCell> cells = [];

    int seatNumber = 1;

    for (final item in pattern) {
      if (item is SeatGap) {
        for (int i = 0; i < item.size; i++) {
          cells.add(const SeatCell.gap());
        }
      } else if (item is int) {
        for (int i = 0; i < item; i++) {
          final seatId = '$rowLabel$seatNumber';

          cells.add(
            SeatCell.seat(
              seat: Seat(
                id: seatId,
                row: rowLabel,
                number: seatNumber,
                status: bookedSeats.contains(seatId)
                    ? SeatStatus.booked
                    : SeatStatus.available,
              ),
            ),
          );

          seatNumber++;
        }
      }
    }

    return SeatRow(rowLabel: rowLabel, cells: cells);
  }
}
