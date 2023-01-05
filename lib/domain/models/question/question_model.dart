import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
abstract class Question with _$Question {
  const Question._();

  const factory Question({
    String? id,
    required int level,
    required String category,
    required String image,
    required String question,
    required String subject,
    required String correctAnswer,
    required List<String> answers,
  }) = _question;

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      level: map['level']?.toInt() ?? 0,
      category: map['category'] ?? '',
      image: map['image'] ?? '',
      question: map['question'] ?? '',
      subject: map['subject'] ?? '',
      correctAnswer: map['correct_answer'] ?? '',
      answers: List<String>.from(map['incorrect_answers'] ?? [])
        ..add(map['correct_answer'] ?? '')
        ..shuffle(),
    );
  }

  factory Question.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return Question.fromMap(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
