import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:inteligivel/firebase/firebase_config.dart';
import 'package:inteligivel/presentation/quiz/quiz_screen.dart';
import 'package:inteligivel/presentation/start/start_screen.dart';

import 'util/app_colors.dart' as app_colors;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
  runApp(const InteligivelApp());
}

class InteligivelApp extends StatelessWidget {
  const InteligivelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
      title: 'Inteligível',
      theme: ThemeData(
        primarySwatch: app_colors.naplesYellow,
        textTheme: TextTheme(
          titleSmall: GoogleFonts.cabinCondensed().merge(
            const TextStyle(
              color: app_colors.battleshipGrey,
              fontSize: 18.0,
              //fontWeight: FontWeight.bold,
            ),
          ),
          titleMedium: GoogleFonts.ebGaramond().merge(
            const TextStyle(
              color: app_colors.eerieBlack, // Colors.white,
              fontSize: 33.0,
            ),
          ),
          bodySmall: GoogleFonts.cabinCondensed().merge(
            const TextStyle(
              color: app_colors.battleshipGrey,
              fontSize: 10.0,
              //fontWeight: FontWeight.bold,
            ),
          ),
          bodyLarge: GoogleFonts.ebGaramond().merge(
            const TextStyle(
              color: app_colors.eerieBlack,
              fontSize: 28.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
      ),
      home: StartScreen(), //QuizScreen(),
    ));
  }
}
