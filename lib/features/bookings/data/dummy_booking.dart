import '../presentation/models/booking.dart';

final List<Booking> dummyBookings = [
  Booking(
    movieName: 'Dune',
    imagePath: 'assets/images/movies/dune.jpg',
    language: 'English',
    theatreName: 'PVR Kochi',
    showDateTime: DateTime.now().add(const Duration(hours: 2)),
    ticketCount: 2,
    seatType: 'Gold',
    seats: ['A1', 'A2'],
  ),
  Booking(
    movieName: 'Spiderman',
    language: 'Malayalam',
    imagePath: 'assets/images/movies/spiderman.jpg',
    theatreName: 'Aries Plex',
    showDateTime: DateTime.now().add(const Duration(days: 1)),
    ticketCount: 3,
    seatType: 'Silver',
    seats: ['B3', 'B4', 'B5'],
  ),
];
