import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/data/repositories/quiz_repository.dart';
import 'package:inteligivel/domain/models/question/question_model.dart';
import 'package:inteligivel/presentation/quiz/quiz_controller.dart';
import 'package:inteligivel/presentation/quiz/quiz_state.dart';
import 'package:inteligivel/presentation/quiz/widgets/quiz_button.dart';

class QuizResults extends HookConsumerWidget {
  final QuizState state;
  final List<Question> questions;

  const QuizResults({
    super.key,
    required this.state,
    required this.questions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '${state.correct.length} / ${questions.length}',
          style: const TextStyle(
            //color: Colors.white,
            fontSize: 60.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const Text(
          'CORRETO!',
          style: TextStyle(
            //color: Colors.white,
            fontSize: 48.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40.0),
        QuizButton(
          title: 'Responder novamente',
          onTap: () {
            ref.refresh(quizRepositoryProvider);
            ref.refresh(quizControllerProvider);
          },
        ),
      ],
    );
  }
}
