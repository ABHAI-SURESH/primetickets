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
        SeatLayoutBuilder.buildRow(
          rowLabel: 'G',
          pattern: [4, const SeatGap(1), 14],
        ),

        SeatLayoutBuilder.buildRow(
          rowLabel: 'F',
          pattern: [4, const SeatGap(1), 14],
        ),
        SeatLayoutBuilder.buildRow(rowLabel: '', pattern: [const SeatGap(1)]),

        SeatLayoutBuilder.buildRow(
          rowLabel: 'E',
          pattern: [4, const SeatGap(1), 14],
        ),

        SeatLayoutBuilder.buildRow(
          rowLabel: 'D',
          pattern: [4, const SeatGap(1), 14],
        ),

        SeatLayoutBuilder.buildRow(
          rowLabel: 'C',
          pattern: [4, const SeatGap(1), 14],
        ),
      ],
    ),

    // NORMAL
    SeatSection(
      category: normalCategory,
      rows: [
        SeatLayoutBuilder.buildRow(
          rowLabel: 'B',
          pattern: [4, const SeatGap(1), 12],
        ),

        SeatLayoutBuilder.buildRow(
          rowLabel: 'A',
          pattern: [4, const SeatGap(1), 12],
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

final List<Screen> dummyScreens = [audi1, audi2, audi3];
