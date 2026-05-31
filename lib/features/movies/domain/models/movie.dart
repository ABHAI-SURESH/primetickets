import 'package:prime_tickets/features/movies/domain/models/person.dart';

class Movie {
  final String id;

  final String title;
  final String imagePath;
  final DateTime releaseDate;
  final String genre;
  final String duration;

  final String certificate; // U, UA13+, A, etc.
  final List<String> languages;

  final double rating;

  final String description;

  final int bookedCount;
  final List<Person> cast;
  final List<Person> crew;

  Movie({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.releaseDate,
    required this.genre,
    required this.duration,
    required this.certificate,
    required this.languages,
    required this.rating,
    required this.description,
    required this.cast,
    required this.crew,
    this.bookedCount = 0,
  });

  /// 🔹 UI HELPER (VERY IMPORTANT)
  /// Shows max 2 languages + remaining count
  String get displayLanguages {
    if (languages.length <= 2) {
      return languages.join(', ');
    } else {
      return '${languages.take(2).join(', ')} +${languages.length - 2}';
    }
  }
}
