import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inteligivel/domain/models/category/category_model.dart';
import 'package:inteligivel/domain/models/question/question_model.dart';
import 'package:inteligivel/firebase/firebase_config.dart';
import 'package:inteligivel/presentation/quiz/quiz_config_screen.dart';
import 'package:inteligivel/presentation/quiz/quiz_screen.dart';
import 'package:inteligivel/presentation/quiz/widgets/quiz_error.dart';
import 'package:inteligivel/presentation/start/start_screen.dart';

Future<FirebaseApp> _firebaseApp =
    Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);

final routes = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: 'start',
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return FutureBuilder(
          future: _firebaseApp,
          builder: (context, app) {
            if (app.connectionState == ConnectionState.done) {
              return const StartScreen();
            }
            if (app.hasError) {
              return const QuizError(message: 'Não foi possível iniciar o aplicativo.');
            }
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
      routes: <RouteBase>[
        GoRoute(
          name: 'config',
          path: 'quiz/config',
          builder: (BuildContext context, GoRouterState state) {
            Category categoryCurrent = state.extra as Category;
            return QuizConfigScreen(categoryCurrent: categoryCurrent);
          },
        ),
        GoRoute(
          name: 'quiz',
          path: 'quiz',
          builder: (BuildContext context, GoRouterState state) {
            List<Question> questions = state.extra as List<Question>;
            return const QuizScreen();
          },
        ),
      ],
    ),
  ],
);
