import 'package:flutter/material.dart';
import 'package:prime_tickets/features/seat_selection/domain/models/screen.dart';
import 'package:prime_tickets/features/seat_selection/domain/models/seat_gap.dart';
import 'package:prime_tickets/features/seat_selection/domain/models/seat_section.dart';
import 'package:prime_tickets/features/seat_selection/domain/models/seat_category.dart';

import 'seat_layout_builder.dart';

final normalCategory = SeatCategory(id: 'normal', name: 'Normal', price: 180);

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

final platinumCategory = SeatCategory(
  id: 'platinum',
  name: 'PLATINUM',
  price: 150,
);

final luxury1Category = SeatCategory(
  id: 'luxury1',
  name: 'LUXURY 1',
  price: 240,
);
final luxury2Category = SeatCategory(
  id: 'luxury2',
  name: 'LUXURY 2',
  price: 240,
);

final audi1 = Screen(
  id: 'screen_1',
  theatreId: '1',
  name: 'Audi 1',
  audioFormat: 'Dolby Atmos',

  sections: [
    // PREMIUM
    SeatSection(
      category: premiumCategory,
      rows: [
        SeatLayoutBuilder.buildRow(rowLabel: 'K', pattern: [25]),

        SeatLayoutBuilder.buildRow(
          rowLabel: 'J',
          pattern: [4, const SeatGap(3), 14, const SeatGap(1), 3],
        ),

        SeatLayoutBuilder.buildRow(
          rowLabel: 'H',
          pattern: [4, const SeatGap(3), 14, const SeatGap(1), 3],
        ),
      ],
    ),

    // EXECUTIVE
    SeatSection(
      category: executiveCategory,
      rows: [
        SeatLayoutBuilder.buildRow(rowLabel: '', pattern: [const SeatGap(1)]),

        SeatLayoutBuilder.buildRow(
          rowLabel: 'G',
          pattern: [4, const SeatGap(3), 14],
        ),

        SeatLayoutBuilder.buildRow(
          rowLabel: 'F',
          pattern: [4, const SeatGap(3), 14],
        ),
        SeatLayoutBuilder.buildRow(rowLabel: '', pattern: [const SeatGap(1)]),

        SeatLayoutBuilder.buildRow(
          rowLabel: 'E',
          pattern: [4, const SeatGap(3), 14],
        ),

        SeatLayoutBuilder.buildRow(
          rowLabel: 'D',
          pattern: [4, const SeatGap(3), 14],
        ),

        SeatLayoutBuilder.buildRow(
          rowLabel: 'C',
          pattern: [4, const SeatGap(3), 14],
        ),
      ],
    ),

    // NORMAL
    SeatSection(
      category: normalCategory,
      rows: [
        SeatLayoutBuilder.buildRow(
          rowLabel: 'B',
          pattern: [4, const SeatGap(3), 14],
        ),

        SeatLayoutBuilder.buildRow(
          rowLabel: 'A',
          pattern: [4, const SeatGap(3), 14],
        ),
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
        SeatLayoutBuilder.buildRow(
          rowLabel: 'A',
          pattern: [2, const SeatGap(1), 2],
        ),
      ],
    ),

    SeatSection(
      category: vipCategory,

      rows: [
        SeatLayoutBuilder.buildRow(
          rowLabel: 'B',
          pattern: [3, const SeatGap(1), 3],
        ),
      ],
    ),

    SeatSection(
      category: executiveCategory,

      rows: [
        SeatLayoutBuilder.buildRow(
          rowLabel: 'C',
          pattern: [4, const SeatGap(1), 4],
        ),
      ],
    ),

    SeatSection(
      category: premiumCategory,

      rows: [
        SeatLayoutBuilder.buildRow(
          rowLabel: 'D',
          pattern: [5, const SeatGap(1), 5],
        ),
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
        SeatLayoutBuilder.buildRow(
          rowLabel: 'A',
          pattern: [2, const SeatGap(1), 2],
        ),
      ],
    ),

    SeatSection(
      category: vipCategory,

      rows: [
        SeatLayoutBuilder.buildRow(
          rowLabel: 'B',
          pattern: [4, const SeatGap(1), 4],
        ),

        SeatLayoutBuilder.buildRow(
          rowLabel: 'C',
          pattern: [4, const SeatGap(1), 4],
        ),
      ],
    ),

    SeatSection(
      category: premiumCategory,

      rows: [
        SeatLayoutBuilder.buildRow(
          rowLabel: 'D',
          pattern: [5, const SeatGap(1), 5],
        ),

        SeatLayoutBuilder.buildRow(
          rowLabel: 'E',
          pattern: [5, const SeatGap(1), 5],
        ),

        SeatLayoutBuilder.buildRow(
          rowLabel: 'F',
          pattern: [5, const SeatGap(1), 5],
        ),
      ],
    ),
  ],
);
final sriMurugan = Screen(
  id: 'srimurugan',
  theatreId: '53',
  name: '4K 3D DOLBY',
  audioFormat: 'Dolby 7.1',

  sections: [
    SeatSection(
      category: luxury1Category,

      rows: [
        SeatLayoutBuilder.buildRow(
          rowLabel: 'A',
          pattern: [const SeatGap(1), 1],
        ),
        SeatLayoutBuilder.buildRow(rowLabel: 'B', pattern: [2]),
        SeatLayoutBuilder.buildRow(rowLabel: 'C', pattern: [2]),
      ],
    ),

    SeatSection(
      category: luxury2Category,

      rows: [
        SeatLayoutBuilder.buildRow(
          rowLabel: 'A',
          pattern: [1, const SeatGap(4), 2],
        ),
        SeatLayoutBuilder.buildRow(
          rowLabel: 'B',
          pattern: [2, const SeatGap(2), 3],
        ),
        SeatLayoutBuilder.buildRow(
          rowLabel: 'C',
          pattern: [2, const SeatGap(2), 3],
        ),
      ],
    ),

    SeatSection(
      category: platinumCategory,

      rows: [
        SeatLayoutBuilder.buildRow(rowLabel: 'A', pattern: [22]),
        SeatLayoutBuilder.buildRow(
          rowLabel: 'B',
          pattern: [9, const SeatGap(3), 10],
        ),
        SeatLayoutBuilder.buildRow(
          rowLabel: 'C',
          pattern: [9, const SeatGap(3), 10],
        ),
        SeatLayoutBuilder.buildRow(
          rowLabel: 'D',
          pattern: [9, const SeatGap(3), 10],
        ),
        SeatLayoutBuilder.buildRow(
          rowLabel: 'E',
          pattern: [9, const SeatGap(3), 10],
        ),
        SeatLayoutBuilder.buildRow(
          rowLabel: 'F',
          pattern: [const SeatGap(4), 5, const SeatGap(3), 6],
        ),
        SeatLayoutBuilder.buildRow(rowLabel: '-', pattern: [const SeatGap(1)]),
        SeatLayoutBuilder.buildRow(
          rowLabel: 'G',
          pattern: [9, const SeatGap(3), 10],
        ),
        SeatLayoutBuilder.buildRow(
          rowLabel: 'H',
          pattern: [9, const SeatGap(3), 10],
        ),
        SeatLayoutBuilder.buildRow(
          rowLabel: 'I',
          pattern: [9, const SeatGap(3), 10],
        ),
        SeatLayoutBuilder.buildRow(
          rowLabel: 'J',
          pattern: [9, const SeatGap(3), 10],
        ),
        SeatLayoutBuilder.buildRow(
          rowLabel: 'K',
          pattern: [9, const SeatGap(3), 10],
        ),
        SeatLayoutBuilder.buildRow(
          rowLabel: 'L',
          pattern: [9, const SeatGap(3), 10],
        ),
        SeatLayoutBuilder.buildRow(
          rowLabel: 'M',
          pattern: [9, const SeatGap(3), 10],
        ),
        SeatLayoutBuilder.buildRow(
          rowLabel: 'N',
          pattern: [9, const SeatGap(3), 10],
        ),
        SeatLayoutBuilder.buildRow(
          rowLabel: 'O',
          pattern: [9, const SeatGap(3), 10],
        ),
        SeatLayoutBuilder.buildRow(
          rowLabel: 'P',
          pattern: [9, const SeatGap(3), 10],
        ),
        SeatLayoutBuilder.buildRow(
          rowLabel: 'Q',
          pattern: [9, const SeatGap(3), 10],
        ),
        SeatLayoutBuilder.buildRow(
          rowLabel: 'R',
          pattern: [9, const SeatGap(3), 10],
        ),
        SeatLayoutBuilder.buildRow(
          rowLabel: 'S',
          pattern: [9, const SeatGap(3), 10],
        ),
        SeatLayoutBuilder.buildRow(
          rowLabel: 'T',
          pattern: [9, const SeatGap(3), 10],
        ),
      ],
    ),
  ],
);

final List<Screen> dummyScreens = [audi1, audi2, audi3, sriMurugan];
