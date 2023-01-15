import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/util/app_colors.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:inteligivel/domain/models/category/category_model.dart';
import 'package:inteligivel/presentation/quiz/quiz_providers.dart';
import 'package:inteligivel/presentation/quiz/widgets/quiz_error.dart';
import 'package:inteligivel/presentation/storage/storage_controller.dart';

class StartScreen extends HookConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Category>> categories = ref.watch(quizCategoriesProvider);
    final pageController = usePageController();

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
            'Inteligível',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: categories.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => const QuizError(
            message: 'Alguma coisa deu muito errado!',
          ),
          data: (categories) => _buildBody(context, ref, pageController, categories..shuffle()),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, PageController pageController,
      List<Category> categories) {
    if (categories.isEmpty) {
      return const QuizError(
        message: 'Ué... estamos sem categorias.',
      );
    }

    final storage = ref.read(storageControllerProvider.notifier);
    final categoriesTitles = categories.map((c) => c.category).toList();
    final categoriesCards = categories
        .map(
          (c) => Hero(
            tag: c.category,
            child: FutureBuilder(
              future: storage.getCategoryUrlImage(c.category),
              builder: (context, urlImage) => urlImage.data == null
                  ? const LinearProgressIndicator(
                      color: AppColors.onyxBlack,
                      backgroundColor: AppColors.eerieBlack,
                    )
                  : Card(
                      elevation: 3,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Image(
                        image: CachedNetworkImageProvider(
                          urlImage.data!,
                        ),
                        height: 182,
                        fit: BoxFit.cover,
                        loadingBuilder: ((context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const Center(
                            child: LinearProgressIndicator(
                              color: AppColors.onyxBlack,
                              backgroundColor: AppColors.eerieBlack,
                            ),
                          );
                        }),
                      ),
                    ),
            ),
          ),
        )
        .toList();

    return VerticalCardPager(
      textStyle: Theme.of(context).textTheme.titleMedium!.merge(
            const TextStyle(
              color: Colors.white,
              fontSize: 42,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.1, 1.1),
                  blurRadius: 11.1,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
          ),
      titles: categoriesTitles,
      images: categoriesCards,
      onPageChanged: (page) {
        if (page != null && page % 1 == 0) {
          debugPrint('VerticalCardPager onPageChanged $page');
        }
      },
      onSelectedItem: (index) {
        debugPrint('VerticalCardPager onSelectedItem $index');
        context.goNamed('config', extra: categories[index]);
      },
    );
  }
}
