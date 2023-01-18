import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

import 'package:inteligivel/domain/models/category/category_model.dart';
import 'package:inteligivel/presentation/quiz/quiz_providers.dart';
import 'package:inteligivel/presentation/quiz/widgets/quiz_error.dart';
import 'package:inteligivel/util/app_colors.dart';

class StartScreen extends HookConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Category>> categories = ref.watch(categoriesProvider);

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
          data: (categories) => _buildBody(context, ref, categories..shuffle()),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, List<Category> categories) {
    if (categories.isEmpty) {
      return const QuizError(
        message: 'Ué... estamos sem categorias.',
      );
    }

    final categoriesTitles = categories.map((c) => c.category).toList();
    final categoriesCards = categories
        .map(
          (c) => Hero(
            tag: c.category,
            child: Card(
              elevation: 3,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image(
                image: CachedNetworkImageProvider(c.image
                    //urlImage.data!,
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
        )
        .toList();

    return VerticalCardPager(
      textStyle: Theme.of(context).textTheme.titleLarge!.merge(
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
