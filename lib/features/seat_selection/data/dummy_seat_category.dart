import 'package:prime_tickets/features/seat_selection/domain/models/seat_category.dart';

const premiumCategory = SeatCategory(
  id: 'premium',
  name: 'Premium',
  price: 180,
);

const executiveCategory = SeatCategory(
  id: 'executive',
  name: 'Executive',
  price: 250,
);

const vipCategory = SeatCategory(id: 'vip', name: 'VIP', price: 450);

const reclinerCategory = SeatCategory(
  id: 'recliner',
  name: 'Recliner',
  price: 600,
);

final seatCategories = [
  premiumCategory,
  executiveCategory,
  vipCategory,
  reclinerCategory,
];
