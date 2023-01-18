import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/data/repositories/questions_repository.dart';
import 'package:inteligivel/presentation/quiz/quiz_controller.dart';
import 'package:inteligivel/presentation/quiz/widgets/quiz_button.dart';
import 'package:inteligivel/util/app_colors.dart';
import 'package:inteligivel/util/app_exception.dart';

class QuizError extends HookConsumerWidget {
  final String message;
  final AppException? appException;

  const QuizError({
    super.key,
    this.message = 'Algo de errado não está certo!',
    this.appException,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (appException == null)
              ? const Icon(Icons.error, size: 88, color: AppColors.battleshipGrey)
              : const Icon(Icons.pest_control, size: 88, color: AppColors.orangeRedCrayola),
          (appException == null)
              ? const SizedBox.shrink()
              : const Text(
                  'BUG!',
                  style: TextStyle(
                    fontSize: 33.0,
                  ),
                ),
          const SizedBox(height: 30),
          Text(
            (appException == null) ? message : appException!.message,
            style: const TextStyle(
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Text(
            (appException == null) ? '' : appException!.origin,
            style: const TextStyle(
              fontSize: 12.0,
            ),
          ),
          const SizedBox(height: 20.0),
          QuizButton(
            title: 'Tentar novamente',
            onTap: () => ref.refresh(questionsRepositoryProvider),
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
      ),
    );
  }
}
