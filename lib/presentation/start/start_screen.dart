import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/domain/models/category/category_model.dart';
import 'package:inteligivel/presentation/quiz/quiz_controller.dart';
import 'package:inteligivel/presentation/quiz/quiz_providers.dart';
import 'package:inteligivel/presentation/quiz/quiz_state.dart';
import 'package:inteligivel/presentation/quiz/widgets/quiz_error.dart';
import 'package:inteligivel/presentation/quiz/widgets/quiz_questions.dart';
import 'package:inteligivel/presentation/quiz/widgets/quiz_results.dart';

import 'package:inteligivel/util/app_colors.dart' as app_colors;

class StartScreen extends HookConsumerWidget {
  StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Category>> categories = ref.watch(quizCategoriesProvider);

    final pageController = usePageController();

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF1FAEE), Color(0xFFF6FFF8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
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
          data: (categories) => _buildBody(context, ref, pageController, categories),
        ),
      ),
    );
  }

  _buildBody(BuildContext context, WidgetRef ref, PageController pageController,
      List<Category> categories) {
    if (categories.isEmpty) return const QuizError(message: 'Ué... estamos sem categorias.');

    return ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return _buildCard(categories[index]);
        });
    // return Card(
    //   child: Text("${categories.first}"),
    // );
  }

  Widget _buildCard(Category c) => Card(
        elevation: 3,
        color: app_colors.culturedWhite,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListTile(
            title: Text(c.category),
            subtitle: Text(c.description),
            onTap: () {},
            leading: const Icon(Icons.place),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      );
}
