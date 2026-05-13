import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle locationLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryText,
  );

  static const TextStyle locationName = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
  );

  static const TextStyle searchHint = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryText,
  );
}