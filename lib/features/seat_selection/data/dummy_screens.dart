import 'package:prime_tickets/features/seat_selection/domain/models/screen.dart';
import 'package:prime_tickets/features/seat_selection/data/seat_layout_builder.dart';

final audi1 = Screen(
  id: 'screen_1',
  theatreId: '1',
  name: 'Audi 1',
  audioFormat: 'Dolby Atmos',

  rows: [
    SeatLayoutBuilder.buildRow(
      rowLabel: 'A',
      pattern: [4, 'gap', 4],
      categoryId: 'premium',
    ),

    SeatLayoutBuilder.buildRow(
      rowLabel: 'B',
      pattern: [4, 'gap', 4],
      categoryId: 'premium',
    ),

    SeatLayoutBuilder.buildRow(
      rowLabel: 'C',
      pattern: [5, 'gap', 5],
      categoryId: 'premium',
    ),
  ],
);

final audi2 = Screen(
  id: 'screen_2',
  theatreId: '1',
  name: 'Audi 2',
  audioFormat: 'Dolby 7.1',

  rows: [
    SeatLayoutBuilder.buildRow(
      rowLabel: 'A',
      pattern: [2, 'gap', 2],
      categoryId: 'recliner',
    ),

    SeatLayoutBuilder.buildRow(
      rowLabel: 'B',
      pattern: [3, 'gap', 3],
      categoryId: 'vip',
    ),

    SeatLayoutBuilder.buildRow(
      rowLabel: 'C',
      pattern: [4, 'gap', 4],
      categoryId: 'executive',
    ),

    SeatLayoutBuilder.buildRow(
      rowLabel: 'D',
      pattern: [5, 'gap', 5],
      categoryId: 'premium',
    ),
  ],
);
