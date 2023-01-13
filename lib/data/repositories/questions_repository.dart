import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/domain/models/question/question_model.dart';
import 'package:inteligivel/firebase/firebase_providers.dart';

abstract class BaseQuestionsRepository {
  Future<List<Question>> getQuestions({
    required int numQuestions,
    required String category,
    //required int level,
  });
}

final questionsRepositoryProvider =
    Provider<QuestionsRepository>((ref) => QuestionsRepository(ref));

class QuestionsRepository implements BaseQuestionsRepository {
  final Ref ref;

  const QuestionsRepository(this.ref);

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
        .limit(numQuestions)
        .get();

    return snap.docs.map((doc) => Question.fromDocument(doc)).toList();
  }
}
