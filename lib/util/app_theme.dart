import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inteligivel/util/app_colors.dart';

ThemeData get appTheme {
  return ThemeData(
    primarySwatch: AppColors.illuminatingEsmerald,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.onyxBlack),
    ),
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
          fontSize: 22.0,
        ),
      ),
      titleLarge: GoogleFonts.ebGaramond().merge(
        const TextStyle(
          color: AppColors.eerieBlack, // Colors.white,
          fontSize: 26.0,
        ),
      ),
      displaySmall: const TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.normal,
        color: Colors.white,
        letterSpacing: 1.0,
      ),
      bodySmall: GoogleFonts.cabinCondensed().merge(
        const TextStyle(
          color: AppColors.battleshipGrey,
          fontSize: 10.0,
          //fontWeight: FontWeight.bold,
        ),
      ),
      bodyMedium: const TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.normal,
        color: Colors.white,
        letterSpacing: 1.0,
      ),
      bodyLarge: GoogleFonts.ebGaramond().merge(
        const TextStyle(
          color: AppColors.eerieBlack,
          fontSize: 28.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    ).apply(
      bodyColor: AppColors.onyxBlack,
      displayColor: AppColors.illuminatingEsmerald,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
  );
}
