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
import 'package:inteligivel/presentation/quiz/widgets/animated_border.dart';
import 'package:inteligivel/presentation/quiz/widgets/difficulty_graph.dart';
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

class QuizConfigScreenState extends ConsumerState<QuizConfigScreen> with TickerProviderStateMixin {
  static late Category categoryCurrent;
  bool init = false;

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    categoryCurrent = widget.categoryCurrent;

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    Tween<double> tween = Tween(begin: 0.0, end: 400.0);

    animation = tween.animate(CurvedAnimation(parent: controller, curve: Curves.easeInExpo))
      ..addListener(() {
        setState(() {});
      });

    controller.forward();

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        init = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final questions = ref.watch(quizCategoryQuestionsProvider(
        QuizConfig(category: categoryCurrent.category, numQuestions: NumQuestionsEnum.min)));

    //final pageController = usePageController();

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: AppColors.backgroundLinearGradient,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.7,
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
          data: (questions) => _buildBody(context, ref, questions..shuffle()),
        ),
        bottomSheet: questions.maybeWhen(
          data: (questions) {
            return QuizButton(
              title: 'Iniciar',
              onTap: () {},
            );
          },
          orElse: () => const SizedBox.shrink(),
        ),
      ),
    );
  }

  _buildBody(BuildContext context, WidgetRef ref, List<Question> questions) {
    if (questions.isEmpty) return const QuizError(message: 'Ué... estamos sem perguntas.');

    final quizState = ref.watch(quizControllerProvider);

    return Stack(
      children: [
        Hero(
          tag: categoryCurrent.category,
          child: ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.onyxBlack, Colors.transparent],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: Image.network(
              categoryCurrent.image,
//              'https://firebasestorage.googleapis.com/v0/b/inteligivel-app.appspot.com/o/images%2Fimg_Grecia_Antiga.jpg?alt=media&token=3672cc20-1135-45c6-b6b9-e58941b4312f',
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                  width: double.infinity,
                  height: 320,
                  child: Stack(
                    children: [
                      AnimatedBorder(animation: animation),
                      Align(
                        alignment: Alignment.center,
                        child: AnimatedOpacity(
                          opacity: init ? 1 : 0,
                          duration: const Duration(milliseconds: 500),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.network(categoryCurrent.image,
                                                width: 40, height: 40),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text("TEMA",
                                                style: Theme.of(context).textTheme.displaySmall),
                                            Text(
                                              '[Subject]',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall!
                                                  .merge(const TextStyle(
                                                      color: AppColors.illuminatingEsmerald)),
                                            )
                                          ]),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            height: 40,
                                            child: Center(
                                              child: DifficultyGraph(
                                                  count: 2), // categoryCurrent.level),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "NÍVEL",
                                            style: Theme.of(context).textTheme.displaySmall,
                                          ),
                                          Text(
                                            '[MODERADO]',
                                            style: Theme.of(context).textTheme.displaySmall!.merge(
                                                const TextStyle(
                                                    color: AppColors.illuminatingEsmerald)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                    child: Divider(
                                      color: Colors.pinkAccent,
                                      height: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                                    child: Text(categoryCurrent.description,
                                        style: Theme.of(context).textTheme.bodyMedium,
                                        maxLines: 6,
                                        overflow: TextOverflow.ellipsis),
                                  )
                                ]),
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
