import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/data/repositories/questions_repository.dart';
import 'package:inteligivel/domain/models/question/question_model.dart';
import 'package:inteligivel/presentation/quiz/quiz_controller.dart';
import 'package:inteligivel/presentation/quiz/quiz_state.dart';
import 'package:inteligivel/presentation/quiz/widgets/quiz_button.dart';
import 'package:inteligivel/util/app_colors.dart';

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
    int rate = (state.correct.length * 100) ~/ questions.length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: rateStars(rate),
        ),
        const SizedBox(height: 40.0),
        Text(
          '${state.correct.length} / ${questions.length}',
          style: const TextStyle(
            fontSize: 66.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10.0),
        Text(
          rateMessage(rate),
          style: const TextStyle(
            fontSize: 33.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20.0),
        Text(
          '$rate%',
          style: const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20.0),
        QuizButton(
          title: 'Responder novamente',
          onTap: () {
            ref.invalidate(questionsRepositoryProvider);
            ref.invalidate(quizControllerProvider);
          },
        ),
        QuizButton(
          title: 'Retornar ao ínicio',
          onTap: () {
            ref.invalidate(questionsRepositoryProvider);
            ref.invalidate(quizControllerProvider);
            context.go('/');
          },
        ),
      ],
    );
  }

  List<Widget> rateStars(int rate) {
    int plus = 1;
    if (rate >= 50 && rate < 100) plus = 2;
    if (rate >= 100) plus = 3;
    return List.generate(
        plus,
        (index) => const Icon(
              Icons.star,
              color: AppColors.illuminatingEsmerald,
              size: 77,
            ));
  }

  String rateMessage(int rate) {
    if (rate >= 100) return 'Perfeito feito!';
    if (rate >= 75) return 'Fez bonito!';
    if (rate >= 50) return 'Aprende é evoluir';
    if (rate >= 25) return 'Seja melhor!';
    return 'Tente outra vez';
  }
}
