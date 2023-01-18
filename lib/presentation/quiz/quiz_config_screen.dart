import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/domain/models/category/category_model.dart';
import 'package:inteligivel/domain/models/quiz_config/num_questions_enum.dart';
import 'package:inteligivel/presentation/quiz/quiz_providers.dart';
import 'package:inteligivel/presentation/quiz/widgets/animated_border.dart';
import 'package:inteligivel/presentation/quiz/widgets/difficulty_graph.dart';
import 'package:inteligivel/presentation/quiz/widgets/quiz_button.dart';
import 'package:inteligivel/presentation/quiz/widgets/quiz_error.dart';
import 'package:inteligivel/presentation/storage/storage_controller.dart';
import 'package:inteligivel/util/app_colors.dart';
import 'package:inteligivel/util/app_exception.dart';

class QuizConfigScreen extends StatefulHookConsumerWidget {
  final Category categoryCurrent;
  const QuizConfigScreen({Key? key, required this.categoryCurrent}) : super(key: key);

  @override
  QuizConfigScreenState createState() => QuizConfigScreenState();
}

class QuizConfigScreenState extends ConsumerState<QuizConfigScreen> with TickerProviderStateMixin {
  static late Category categoryCurrent;
  int numQuestionsIndex = 0;
  int maxQuestions = 0;
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
    final countQuestionsResult = ref.watch(
      categoryQuestionsCountProvider(categoryCurrent.category),
    );

    //String imgSubjectURL = 'zzz';
    final imgSubjectResult = ref
        .read(storageControllerProvider.notifier)
        .getSubjectUrlImage(categoryCurrent.subject)
        .then((value) => print(value));

    //print('img Subject URL $imgSubjectURL');

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: AppColors.backgroundLinearGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: countQuestionsResult.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => QuizError(appException: (error as AppException)),
          data: (countQuestions) => _buildBody(context, ref, countQuestions),
        ),
        bottomSheet: countQuestionsResult.maybeWhen(
          data: (countQuestions) {
            return (countQuestions > 0)
                ? QuizButton(
                    title: 'Iniciar',
                    onTap: () {
                      debugPrint('QuizConfig QuizButton ${categoryCurrent.category}');
                      context.goNamed('quiz', params: {
                        'category': categoryCurrent.category,
                        'numQuestions':
                            NumQuestionsEnum.getByIndex(numQuestionsIndex).value.toString(),
                      });
                    })
                : const SizedBox.shrink();
          },
          orElse: () => const SizedBox.shrink(),
        ),
      ),
    );
  }

  _buildBody(BuildContext context, WidgetRef ref, int countQuestions) {
    if (countQuestions == 0) return const QuizError(message: 'Ué... estamos sem perguntas.');

    maxQuestions = countQuestions;

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
            child: Image(
              image: CachedNetworkImageProvider(
                categoryCurrent.image,
              ),
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 5, top: 45),
          child: BackButton(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 100),
                width: double.infinity,
                height: (MediaQuery.of(context).size.height / 3) * 2,
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
                                  Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                    Image(
                                        image: CachedNetworkImageProvider(
                                          categoryCurrent.image,
                                        ),
                                        width: 40,
                                        height: 40),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text('TEMA'),
                                    Text(
                                      categoryCurrent.subject,
                                      style: Theme.of(context).textTheme.displaySmall!.merge(
                                          const TextStyle(color: AppColors.illuminatingEsmerald)),
                                    )
                                  ]),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 40,
                                        child: Center(
                                          child: DifficultyGraph(
                                              count:
                                                  categoryCurrent.level), // categoryCurrent.level),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text('NÍVEL'),
                                      Text(
                                        categoryCurrent.level.toString(),
                                        style: Theme.of(context).textTheme.displaySmall!.merge(
                                            const TextStyle(color: AppColors.illuminatingEsmerald)),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.0),
                                child: Divider(
                                  color: AppColors.battleshipGrey,
                                  height: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                                child: Text(categoryCurrent.description,
                                    style: Theme.of(context).textTheme.bodyMedium,
                                    maxLines: 6,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.0),
                                child: Text(
                                  'Quantidade de questões:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                                child: AnimatedToggleSwitch<int>.rolling(
                                  current: numQuestionsIndex,
                                  borderColor: AppColors.gainsboroGrey,
                                  indicatorColor: AppColors.illuminatingEsmerald,
                                  indicatorSize: const Size.fromWidth(64),
                                  values: const [0, 1, 2, 3],
                                  onChanged: (i) => setState(() => numQuestionsIndex = i),
                                  iconBuilder: rollingIconBuilder,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: init ? 1.0 : 0.0,
            child: Container(
              margin: const EdgeInsets.only(bottom: 100),
              width: double.infinity,
              height: (MediaQuery.of(context).size.height / 3) * 2,
              child: Center(
                child: Text(
                  categoryCurrent.category,
                  style: Theme.of(context).textTheme.titleMedium!.merge(
                        const TextStyle(
                          fontSize: 42,
                        ),
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget rollingIconBuilder(int numQuestionsIndex, Size iconSize, bool foreground) {
    if (numQuestionsIndex == 3) {
      return CircleAvatar(
        backgroundColor: AppColors.illuminatingEsmerald,
        foregroundColor: AppColors.culturedWhite,
        child: Text(maxQuestions.toString()),
      );
    }
    return CircleAvatar(
      backgroundColor: AppColors.illuminatingEsmerald,
      foregroundColor: AppColors.culturedWhite,
      child: Text(NumQuestionsEnum.getByIndex(numQuestionsIndex).description),
    );
  }
}
