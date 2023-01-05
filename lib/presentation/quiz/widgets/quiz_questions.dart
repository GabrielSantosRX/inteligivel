import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:html_character_entities/html_character_entities.dart';
import 'package:inteligivel/domain/models/question/question_model.dart';
import 'package:inteligivel/presentation/quiz/quiz_controller.dart';
import 'package:inteligivel/presentation/quiz/quiz_state.dart';
import 'package:inteligivel/presentation/quiz/widgets/answer_card.dart';

import 'package:inteligivel/util/app_colors.dart' as app_colors;

class QuizQuestions extends HookConsumerWidget {
  final QuizState state;
  final List<Question> questions;
  final PageController pageController;

  const QuizQuestions({
    super.key,
    required this.pageController,
    required this.state,
    required this.questions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int index) {
        final question = questions[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${question.category} ${index + 1} ~ ${questions.length}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 12.0),
              child: Text(
                HtmlCharacterEntities.decode(question.question),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const Divider(
              color: app_colors.illuminatingEsmerald,
              height: 32.0,
              thickness: 2.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
            Column(
              children: question.answers
                  .map(
                    (e) => AnswerCard(
                      answer: e,
                      isSelected: e == state.selectedAnswer,
                      isCorrect: e == question.correctAnswer,
                      isDisplayingAnswer: state.answered,
                      onTap: () =>
                          ref.read(quizControllerProvider.notifier).submitAnswer(question, e),
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}
