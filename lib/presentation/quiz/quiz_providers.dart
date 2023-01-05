import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/data/repositories/categories_repository.dart';
import 'package:inteligivel/data/repositories/quiz_repository.dart';
import 'package:inteligivel/domain/models/category/category_model.dart';
import 'package:inteligivel/domain/models/question/question_model.dart';

final quizQuestionsProvider = FutureProvider.autoDispose<List<Question>>(
  (ref) => ref.watch(quizRepositoryProvider).getQuestions(
        numQuestions: 3,
        category: 'estoicismo',
      ),
);

final quizCategoriesProvider = FutureProvider.autoDispose<List<Category>>(
  (ref) => ref.watch(categoriesRepositoryProvider).getAllCategories(),
);
