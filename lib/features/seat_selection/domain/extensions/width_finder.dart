import '../models/screen.dart';

extension WidthFinder on Screen {
  double get widestRowWidth {
    int longestRow = 0;

    for (final section in sections) {
      for (final row in section.rows) {
        if (row.cells.length > longestRow) {
          longestRow = row.cells.length;
        }
      }
    }

    return longestRow * 24.0;
  }
}
