import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/data/repositories/questions_repository.dart';
import 'package:inteligivel/presentation/quiz/widgets/quiz_button.dart';

class QuizError extends HookConsumerWidget {
  final String message;
  final String messageException;

  const QuizError({
    super.key,
    this.message = 'Algo de errado não está certo!',
    this.messageException = '',
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
              fontSize: 22.0,
            ),
          ),
          Text(
            messageException,
            style: const TextStyle(
              fontSize: 7.0,
            ),
          ),
          const SizedBox(height: 20.0),
          QuizButton(
            title: 'Tentar novamente',
            onTap: () => ref.refresh(questionsRepositoryProvider),
          ),
        ],
      ),
    );
  }
}
