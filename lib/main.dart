import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/data/repositories/quiz_repository.dart';
import 'package:inteligivel/domain/models/item/item_model.dart';
import 'package:inteligivel/domain/models/question_model.dart';
import 'package:inteligivel/presentation/auth/auth_controller.dart';
import 'package:inteligivel/presentation/quiz/quiz_providers.dart';
import 'package:inteligivel/presentation/quiz/quiz_screen.dart';
import 'package:inteligivel/firebase/firebase_config.dart';
import 'util/app_colors.dart' as app_colors;

import 'package:flutter/foundation.dart';
import 'package:html_character_entities/html_character_entities.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
  runApp(InteligivelApp());
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
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
      ),
      home: const QuizScreen(),
    ));
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(authControllerProvider.notifier).appStarted();

    return Scaffold(
      appBar: AppBar(
        title: TitleWidget(),
        leading: ref.read(authControllerProvider.notifier).user != null
            ? IconButton(
                icon: const Icon(Icons.logout),
                onPressed: (() => ref.read(authControllerProvider.notifier).signOut()),
              )
            : null,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('teste').snapshots(),
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (!snapshot.hasData) return const SizedBox.shrink();
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final docData = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                final dateTime = (docData['timestamp'] as Timestamp).toDate();
                return ListTile(
                  title: Text('$dateTime'),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TitleWidget extends HookConsumerWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Question>> questions = ref.watch(quizQuestionsProvider);

    return questions.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
      data: (questions) {
        return Text(questions.first.correctAnswer);
      },
    );

    //return Text('Inteligível');
  }
}
