import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:inteligivel/firebase/firebase_config.dart';
import 'package:inteligivel/presentation/quiz/widgets/quiz_error.dart';
import 'package:inteligivel/presentation/start/start_screen.dart';

import 'package:inteligivel/routes.dart';
import 'package:inteligivel/util/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(InteligivelApp());
}

class InteligivelApp extends StatelessWidget {
  InteligivelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'Inteligível',
        theme: ThemeData(
          primarySwatch: AppColors.naplesYellow,
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
                fontSize: 33.0,
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
          bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
        ),
        routerConfig: routes,
        // home: FutureBuilder(
        //   future: _firebaseApp,
        //   builder: (context, app) {
        //     if (app.connectionState == ConnectionState.done) {
        //       return const StartScreen();
        //     }
        //     if (app.hasError) {
        //       return const QuizError(message: 'Não foi possível iniciar o aplicativo.');
        //     }
        //     return const Center(child: CircularProgressIndicator());
        //   },
        // ),
      ),
    );
  }
}
