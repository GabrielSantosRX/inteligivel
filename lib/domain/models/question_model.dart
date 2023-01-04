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
/*
class Question extends Equatable {
  String? id,
  final int level;
  final String category;
  final String image;
  final String question;
  final String subject;
  final String correctAnswer;
  final List<String> answers;

  const Question({
    required this.level,
    required this.category,
    required this.image,
    required this.question,
    required this.subject,
    required this.correctAnswer,
    required this.answers,
  });

  @override
  List<Object> get props {
    return [
      level,
      category,
      image,
      question,
      subject,
      correctAnswer,
      answers,
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'level': level,
      'category': category,
      'image': image,
      'question': question,
      'subject': subject,
      'correctAnswer': correctAnswer,
      'answers': answers,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      level: map['level']?.toInt() ?? 0,
      category: map['category'] ?? '',
      image: map['image'] ?? '',
      question: map['question'] ?? '',
      subject: map['subject'] ?? '',
      correctAnswer: map['correctAnswer'] ?? '',
      answers: List<String>.from(map['incorrect_answers'] ?? [])
        ..add(map['correct_answer'] ?? '')
        ..shuffle(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) => Question.fromMap(json.decode(source));

  factory Question.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return Question.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');

  Question copyWith({
    int? level,
    String? category,
    String? image,
    String? question,
    String? subject,
    String? correctAnswer,
    List<String>? answers,
  }) {
    return Question(
      level: level ?? this.level,
      category: category ?? this.category,
      image: image ?? this.image,
      question: question ?? this.question,
      subject: subject ?? this.subject,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      answers: answers ?? this.answers,
    );
  }

  @override
  String toString() {
    return 'Question(level: $level, category: $category, image: $image, question: $question, subject: $subject, correctAnswer: $correctAnswer, answers: $answers)';
  }
}
*/