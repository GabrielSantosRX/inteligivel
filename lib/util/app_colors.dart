import 'package:flutter/material.dart';

class AppColors {
  static const Map<int, Color> _swatch = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };

  static const culturedWhite = MaterialColor(0xFFF8F9FA, _swatch);
  static const culturedGrey = MaterialColor(0xFFE9ECEF, _swatch);
  static const gainsboroGrey = MaterialColor(0xFFDEE2E6, _swatch);
  static const battleshipGrey = MaterialColor(0xFF878782, _swatch);
  static const onyxBlack = MaterialColor(0xFF343A40, _swatch);
  static const eerieBlack = MaterialColor(0xFF1F1F1E, _swatch);
  static const orangeRedCrayola = MaterialColor(0xFFF25F5C, _swatch);
  static const naplesYellow = MaterialColor(0xFFFFE066, _swatch);
  static const cgBlue = MaterialColor(0xFF247BA0, _swatch);
  static const illuminatingEsmerald = MaterialColor(0xFF3D8F81, _swatch);

  static const backgroundLinearGradient = LinearGradient(
    colors: [Color(0xFFF8F9FA), Color(0xFFDEE2E6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const greyscale = ColorFilter.matrix(<double>[
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0,
    0,
    0,
    1,
    0
  ]);
}
