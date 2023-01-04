import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/domain/models/question_model.dart';
import 'package:inteligivel/firebase/firebase_providers.dart';

abstract class BaseQuizRepository {
  Future<List<Question>> getQuestions({
    required int numQuestions,
    required String category,
    //required int level,
  });
}

final quizRepositoryProvider = Provider<QuizRepository>((ref) => QuizRepository(ref));

class QuizRepository implements BaseQuizRepository {
  final Ref ref;

  const QuizRepository(this.ref);

  @override
  Future<List<Question>> getQuestions({
    required int numQuestions,
    required String category,
    //required int level,
  }) async {
    final snap = await ref
        .read(firebaseFirestoreProvider)
        .collection('questions')
        .where('category', isEqualTo: category)
        .get();

    return snap.docs.map((doc) => Question.fromDocument(doc)).toList();
  }
}
