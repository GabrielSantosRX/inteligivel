import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/domain/models/question/question_model.dart';
import 'package:inteligivel/firebase/firebase_providers.dart';
import 'package:inteligivel/util/app_exception.dart';

abstract class BaseQuestionsRepository {
  Future<List<Question>> getQuestions({
    required int numQuestions,
    required String category,
  });

  Future<int> getQuestionsCount({required String category});
}

final questionsRepositoryProvider = Provider<QuestionsRepository>(
  (ref) => QuestionsRepository(ref),
);

class QuestionsRepository implements BaseQuestionsRepository {
  final Ref ref;

  const QuestionsRepository(this.ref);

  @override
  Future<List<Question>> getQuestions({
    required int numQuestions,
    required String category,
  }) async {
    try {
      final snap = await ref
          .read(firebaseFirestoreProvider)
          .collection('questions')
          .where('category', isEqualTo: category)
          //.limit(numQuestions)
          .get();

      var result = snap.docs.map((doc) => Question.fromDocument(doc)).toList()..shuffle();
      return (numQuestions > result.length) ? result : result.sublist(0, numQuestions);
    } catch (e) {
      throw AppException(inception: runtimeType, message: e.toString());
    }
  }

  @override
  Future<int> getQuestionsCount({required String category}) async {
    try {
      final snap = await ref
          .read(firebaseFirestoreProvider)
          .collection('questions')
          .where('category', isEqualTo: category)
          .count()
          .get();

      return snap.count;
    } catch (e) {
      throw AppException(inception: runtimeType, message: e.toString());
    }
  }
}
