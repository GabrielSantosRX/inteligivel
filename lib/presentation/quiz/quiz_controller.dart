import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/domain/models/question/question_model.dart';
import 'package:inteligivel/presentation/quiz/quiz_state.dart';

final quizControllerProvider = StateNotifierProvider.autoDispose<QuizController, QuizState>(
  (ref) => QuizController(),
);

class QuizController extends StateNotifier<QuizState> {
  QuizController() : super(QuizState.initial());

  void submitAnswer(Question currentQuestion, String answer) {
    if (state.answered) return;
    if (currentQuestion.correctAnswer == answer) {
      state = state.copyWith(
        selectedAnswer: answer,
        correct: [...state.correct, currentQuestion],
        status: QuizStatus.correct,
      );
    } else {
      state = state.copyWith(
        selectedAnswer: answer,
        incorrect: [...state.incorrect, currentQuestion],
        status: QuizStatus.incorrect,
      );
    }
  }

  void nextQuestion(List<Question> questions, int currentIndex) {
    state = state.copyWith(
      selectedAnswer: '',
      status: currentIndex + 1 < questions.length ? QuizStatus.initial : QuizStatus.complete,
    );
  }

  void reset() {
    state = QuizState.initial();
  }
}
