import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/data/repositories/quiz_repository.dart';
import 'package:inteligivel/presentation/quiz/widgets/quiz_button.dart';

class QuizError extends HookConsumerWidget {
  final String message;

  const QuizError({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 20.0),
          QuizButton(
            title: 'Tentar novamente',
            onTap: () => ref.refresh(quizRepositoryProvider),
          ),
        ],
      ),
    );
  }
}
