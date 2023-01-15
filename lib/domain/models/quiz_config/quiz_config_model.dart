import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inteligivel/domain/models/quiz_config/num_questions_enum.dart';
part 'quiz_config_model.freezed.dart';
//part 'quiz_config_model.g.dart';

@freezed
abstract class QuizConfig with _$QuizConfig {
  factory QuizConfig({
    required String category,
    required NumQuestionsEnum numQuestions,
  }) = _QuizConfig;

  factory QuizConfig.empty() => QuizConfig(category: '', numQuestions: NumQuestionsEnum.all);
}
