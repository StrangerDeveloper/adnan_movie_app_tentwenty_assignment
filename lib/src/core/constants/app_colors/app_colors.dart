import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  final Color primary = const Color(0xFF2E2739);
  final Color primaryLight = const Color(0xFF00B13F);
  final Color primaryDark = const Color(0xFF002035);

  // Secondary Colors
  final Color secondary = const Color(0xFFFFFFFF);
  final Color secondaryDark = const Color(0xFF142244);

  final Color selectedItemColor = const Color(0xFFF6F6FA);
  final Color unSelectedItemColor = const Color(0xFF827D88);

  final Color greyColor = const Color(0xFFDBDBDF);

  //seat Colors
  final Color regularSeatColor = const Color(0xFF61C3F2);
  final Color notAvailableSeatColor = const Color(0xFFA6A6A6);
  final Color vipSeatColor = const Color(0xFF564CA3);
  final Color selectedSeatColor = const Color(0xFFCD9D0F);

  // Genre Colors
  final Color genreTeal = const Color(0xFF15D2BC);
  final Color genrePink = const Color(0xFFE26CA5);
  final Color genrePurple = const Color(0xFF564CA3);
  final Color genreOrange = const Color(0xFFF39C12);
  final Color genreBlue = const Color(0xFF3498DB);
  final Color genreGreen = const Color(0xFF2ECC71);

  // Neutral Colors
  final Color white = const Color(0xFFFFFFFF);
  final Color black = const Color(0xFF000000);
  final Color transparent = Colors.transparent;

  // Grey Scale Colors
  final Color lightGrey = const Color(0xFFF4F4F4);
  final Color lightGrey2 = const Color(0xFFF2F2F2);
  final Color lightGrey3 = const Color(0xFFF5F5F5);
  final Color lightGrey4 = const Color(0xFFF5F5F5);
  final Color lightGrey5 = const Color(0xFFDEDEDE);
  final Color lightGrey6 = const Color(0xFF8F9CA4);
  final Color grey = const Color(0xFFE6E6E6);
  final Color darkGrey = const Color(0xFFE6E6E6);
  final Color buttonGrey = Colors.grey;

  // Semantic Colors
  final Color error = Colors.red;
  final Color success = const Color(0xFF00B13E); // Update with Figma hex
  final Color warning = Colors.orange; // Update with Figma hex
  final Color info = Colors.blue; // Update with Figma hex

  // Special Colors
  final Color alphaBlack = const Color(0x0F002035);
  final Color shadowColor = Colors.grey; // Will be used with opacity
  final Color shadowColorWithOpacity = Colors.grey.withValues(alpha: 0.5);

  // Background Colors
  final Color background = const Color(0xFFF4F4F4); // Update with Figma hex
  final Color surface = const Color(0xFFFFFFFF); // Update with Figma hex

  // Text Colors
  final Color textPrimary = const Color(0xFF000000); // Update with Figma hex
  final Color textSecondary = const Color(0xFF8F9CA4); // Update with Figma hex
  final Color textDisabled = const Color(0xFFDEDEDE); // Update with Figma hex

  // Border Colors
  final Color border = const Color(0xFFE6E6E6); // Update with Figma hex
  final Color borderLight = const Color(0xFFF5F5F5); // Update with Figma hex
}
