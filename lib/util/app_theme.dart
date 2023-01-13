import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inteligivel/util/app_colors.dart';

ThemeData get appTheme {
  return ThemeData(
    primarySwatch: AppColors.orangeRedCrayola,
    textTheme: TextTheme(
      titleSmall: GoogleFonts.cabinCondensed().merge(
        const TextStyle(
          color: AppColors.battleshipGrey,
          fontSize: 18.0,
          //fontWeight: FontWeight.bold,
        ),
      ),
      titleMedium: GoogleFonts.ebGaramond().merge(
        const TextStyle(
          color: AppColors.eerieBlack, // Colors.white,
          fontSize: 26.0,
        ),
      ),
      bodySmall: GoogleFonts.cabinCondensed().merge(
        const TextStyle(
          color: AppColors.battleshipGrey,
          fontSize: 10.0,
          //fontWeight: FontWeight.bold,
        ),
      ),
      bodyLarge: GoogleFonts.ebGaramond().merge(
        const TextStyle(
          color: AppColors.eerieBlack,
          fontSize: 28.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
  );
}
