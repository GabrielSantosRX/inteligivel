import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/domain/models/category/category_model.dart';
import 'package:inteligivel/domain/models/question/question_model.dart';
import 'package:inteligivel/domain/models/quiz_config/num_questions_enum.dart';
import 'package:inteligivel/domain/models/quiz_config/quiz_config_model.dart';
import 'package:inteligivel/presentation/quiz/quiz_controller.dart';
import 'package:inteligivel/presentation/quiz/quiz_providers.dart';
import 'package:inteligivel/presentation/quiz/quiz_state.dart';
import 'package:inteligivel/presentation/quiz/widgets/quiz_button.dart';
import 'package:inteligivel/presentation/quiz/widgets/quiz_error.dart';
import 'package:inteligivel/presentation/quiz/widgets/quiz_questions.dart';
import 'package:inteligivel/presentation/quiz/widgets/quiz_results.dart';
import 'package:inteligivel/util/app_colors.dart';

class QuizConfigScreen extends StatefulHookConsumerWidget {
  final Category categoryCurrent;
  const QuizConfigScreen({Key? key, required this.categoryCurrent}) : super(key: key);

  @override
  QuizConfigScreenState createState() => QuizConfigScreenState();
}

class QuizConfigScreenState extends ConsumerState<QuizConfigScreen> {
  static late Category categoryCurrent;

  @override
  void initState() {
    categoryCurrent = widget.categoryCurrent;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final questions = ref.watch(quizCategoryQuestionsProvider(
        QuizConfig(category: categoryCurrent.category, numQuestions: NumQuestionsEnum.min)));

    final pageController = usePageController();
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: AppColors.backgroundLinearGradient,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            categoryCurrent.category,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: questions.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => QuizError(messageException: error.toString()),
          data: (questions) => _buildBody(context, ref, pageController, questions..shuffle()),
        ),
        bottomSheet: questions.maybeWhen(
          data: (questions) {
            final quizState = ref.watch(quizControllerProvider);
            if (!quizState.answered) return const SizedBox.shrink();
            return QuizButton(
              title: pageController.page! + 1 < questions.length ? 'Continuar' : 'Ver resultados',
              onTap: () {
                ref
                    .read(quizControllerProvider.notifier)
                    .nextQuestion(questions, pageController.page!.toInt());
                if (pageController.page! + 1 < questions.length) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.linear,
                  );
                }
              },
            );
          },
          orElse: () => const SizedBox.shrink(),
        ),
      ),
    );
  }

  _buildBody(BuildContext context, WidgetRef ref, PageController pageController,
      List<Question> questions) {
    if (questions.isEmpty) return const QuizError(message: 'Ué... estamos sem perguntas.');

    final quizState = ref.watch(quizControllerProvider);

    return quizState.status == QuizStatus.complete
        ? QuizResults(state: quizState, questions: questions)
        : QuizQuestions(
            pageController: pageController,
            state: quizState,
            questions: questions,
          );
  }
}
