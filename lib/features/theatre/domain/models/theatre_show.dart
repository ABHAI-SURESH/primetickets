import 'show_time.dart';

class TheatreShow {
  final String id;
  final String theatreId;
  final String movieId;

  final DateTime date;

  final List<ShowTime> showTimes;

  TheatreShow({
    required this.id,
    required this.theatreId,
    required this.movieId,
    required this.date,
    required this.showTimes,
  });
}
