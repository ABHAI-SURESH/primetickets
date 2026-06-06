import 'seat_status.dart';

class Seat {
  final String id;
  final String row;
  final int number;
  final String categoryId;
  SeatStatus status;

  Seat({
    required this.id,
    required this.row,
    required this.number,
    required this.categoryId,
    required this.status,
  });
}
