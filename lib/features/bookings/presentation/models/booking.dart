class Booking {
  final String movieName;
  final String language;
  final String imagePath;
  final String theatreName;
  final DateTime showDateTime;
  final int ticketCount;
  final String seatType;
  final List<String> seats;

  Booking({
    required this.movieName,
    required this.language,
    required this.imagePath,
    required this.theatreName,
    required this.showDateTime,
    required this.ticketCount,
    required this.seatType,
    required this.seats,
  });
}
