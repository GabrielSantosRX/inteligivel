import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/data/repositories/categories_repository.dart';
import 'package:inteligivel/data/repositories/questions_repository.dart';
import 'package:inteligivel/domain/models/category/category_model.dart';
import 'package:inteligivel/domain/models/question/question_model.dart';
import 'package:inteligivel/domain/models/quiz_config/quiz_config_model.dart';

final quizCategoryQuestionsProvider = FutureProvider.autoDispose.family<List<Question>, QuizConfig>(
  (ref, quizConfig) => ref.watch(questionsRepositoryProvider).getQuestions(
        numQuestions: quizConfig.numQuestions.value,
        category: quizConfig.category,
      ),
);

final quizCategoriesProvider = FutureProvider.autoDispose<List<Category>>(
  (ref) => ref.watch(categoriesRepositoryProvider).getAllCategories(),
);
