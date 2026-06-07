import 'package:prime_tickets/features/seat_selection/domain/models/screen.dart';
import 'package:prime_tickets/features/seat_selection/domain/models/seat_section.dart';
import 'package:prime_tickets/features/seat_selection/domain/models/seat_category.dart';

import 'seat_layout_builder.dart';

final premiumCategory = SeatCategory(
  id: 'premium',
  name: 'Premium',
  price: 310,
);

final executiveCategory = SeatCategory(
  id: 'executive',
  name: 'Executive',
  price: 280,
);

final vipCategory = SeatCategory(id: 'vip', name: 'VIP', price: 450);

final reclinerCategory = SeatCategory(
  id: 'recliner',
  name: 'Recliner',
  price: 650,
);

final audi1 = Screen(
  id: 'screen_1',
  theatreId: '1',
  name: 'Audi 1',
  audioFormat: 'Dolby Atmos',

  sections: [
    SeatSection(
      category: premiumCategory,

      rows: [
        SeatLayoutBuilder.buildRow(
          rowLabel: 'A',
          pattern: ['gap', 4, 'gap', 4],
        ),

        SeatLayoutBuilder.buildRow(
          rowLabel: 'B',
          pattern: ['gap', 4, 'gap', 4],
        ),

        SeatLayoutBuilder.buildRow(rowLabel: 'C', pattern: [5, 'gap', 5]),
      ],
    ),
  ],
);

final audi2 = Screen(
  id: 'screen_2',
  theatreId: '1',
  name: 'Audi 2',
  audioFormat: 'Dolby 7.1',

  sections: [
    SeatSection(
      category: reclinerCategory,

      rows: [
        SeatLayoutBuilder.buildRow(rowLabel: 'A', pattern: [2, 'gap', 2]),
      ],
    ),

    SeatSection(
      category: vipCategory,

      rows: [
        SeatLayoutBuilder.buildRow(rowLabel: 'B', pattern: [3, 'gap', 3]),
      ],
    ),

    SeatSection(
      category: executiveCategory,

      rows: [
        SeatLayoutBuilder.buildRow(rowLabel: 'C', pattern: [4, 'gap', 4]),
      ],
    ),

    SeatSection(
      category: premiumCategory,

      rows: [
        SeatLayoutBuilder.buildRow(rowLabel: 'D', pattern: [5, 'gap', 5]),
      ],
    ),
  ],
);

final audi3 = Screen(
  id: 'screen_3',
  theatreId: '1',
  name: 'Audi 3',
  audioFormat: 'Dolby Atmos',

  sections: [
    SeatSection(
      category: reclinerCategory,

      rows: [
        SeatLayoutBuilder.buildRow(rowLabel: 'A', pattern: [2, 'gap', 2]),
      ],
    ),

    SeatSection(
      category: vipCategory,

      rows: [
        SeatLayoutBuilder.buildRow(rowLabel: 'B', pattern: [4, 'gap', 4]),

        SeatLayoutBuilder.buildRow(rowLabel: 'C', pattern: [4, 'gap', 4]),
      ],
    ),

    SeatSection(
      category: premiumCategory,

      rows: [
        SeatLayoutBuilder.buildRow(rowLabel: 'D', pattern: [5, 'gap', 5]),

        SeatLayoutBuilder.buildRow(rowLabel: 'E', pattern: [5, 'gap', 5]),

        SeatLayoutBuilder.buildRow(rowLabel: 'F', pattern: [5, 'gap', 5]),
      ],
    ),
  ],
);

final List<Screen> dummyScreens = [audi1, audi2, audi3];
