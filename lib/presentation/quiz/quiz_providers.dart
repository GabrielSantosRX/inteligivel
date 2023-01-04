import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/data/repositories/quiz_repository.dart';
import 'package:inteligivel/domain/models/question_model.dart';

final quizQuestionsProvider = FutureProvider.autoDispose<List<Question>>(
  (ref) => ref.watch(quizRepositoryProvider).getQuestions(
        numQuestions: 3,
        category: 'estoicismo', //Random().nextInt(24) + 9,
      ),
);
