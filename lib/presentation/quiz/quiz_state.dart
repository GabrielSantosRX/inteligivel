import 'package:equatable/equatable.dart';
import 'package:inteligivel/domain/models/question/question_model.dart';

enum QuizStatus { initial, correct, incorrect, complete }

class QuizState extends Equatable {
  final String category;
  final String selectedAnswer;
  final List<Question> correct;
  final List<Question> incorrect;
  final QuizStatus status;

  bool get answered => status == QuizStatus.incorrect || status == QuizStatus.correct;

  const QuizState({
    required this.category,
    required this.selectedAnswer,
    required this.correct,
    required this.incorrect,
    required this.status,
  });

  factory QuizState.initial() {
    return const QuizState(
      category: '',
      selectedAnswer: '',
      correct: [],
      incorrect: [],
      status: QuizStatus.initial,
    );
  }

  @override
  List<Object> get props => [
        category,
        selectedAnswer,
        correct,
        incorrect,
        status,
      ];

  QuizState copyWith({
    String? category,
    String? selectedAnswer,
    List<Question>? correct,
    List<Question>? incorrect,
    QuizStatus? status,
  }) {
    return QuizState(
      category: category ?? this.category,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
      correct: correct ?? this.correct,
      incorrect: incorrect ?? this.incorrect,
      status: status ?? this.status,
    );
  }
}
