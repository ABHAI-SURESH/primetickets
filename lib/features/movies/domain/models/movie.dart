class Movie {
  final String id;

  final String title;
  final String imagePath;

  final String genre;
  final String duration;

  final String certificate; // U, UA13+, A, etc.
  final List<String> languages;

  final double rating;

  final String description;

  final int bookedCount;

  Movie({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.genre,
    required this.duration,
    required this.certificate,
    required this.languages,
    required this.rating,
    required this.description,
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
