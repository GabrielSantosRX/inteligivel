import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/domain/models/category/category_model.dart';
import 'package:inteligivel/firebase/firebase_providers.dart';
import 'package:inteligivel/presentation/quiz/quiz_providers.dart';
import 'package:inteligivel/presentation/quiz/widgets/quiz_error.dart';
import 'package:inteligivel/presentation/storage/storage_controller.dart';

import 'package:inteligivel/util/app_colors.dart';

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
        gradient: LinearGradient(
          colors: [Color(0xFFF1FAEE), Color(0xFFF6FFF8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Inteligível',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              categories.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, _) => const QuizError(
                  message: 'Alguma coisa deu muito errado!',
                ),
                data: (categories) =>
                    _buildBody(context, ref, pageController, categories..shuffle()),
              ),
              Container(
                  height: 33,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white, Colors.white.withOpacity(0.0)]))),
            ],
          )),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, PageController pageController,
      List<Category> categories) {
    if (categories.isEmpty) return const QuizError(message: 'Ué... estamos sem categorias.');

    final storage = ref.read(storageControllerProvider.notifier);

    return ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return _buildCard(context, index, categories[index], storage);
        });
    // return Card(
    //   child: Text("${categories.first}"),
    // );
  }

  Widget _buildCard(BuildContext context, int index, Category c, StorageController storage) => Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      //color: app_colors.culturedWhite,
      child: GestureDetector(
        onTap: () => {
          context.goNamed('quiz', params: {'category': c.category})
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            FutureBuilder(
              future: storage.getCategoryUrlImage(c.category),
              builder: (context, urlImage) => urlImage.data == null
                  ? const LinearProgressIndicator()
                  : Ink.image(
                      image: NetworkImage(urlImage.data!),
                      height: 182,
                      fit: BoxFit.cover,
                      //colorFilter: index % 2 == 0 ? null : AppColors.greyscale,
                      child: InkWell(
                        onTap: () {},
                      ),
                    ),
            ),
            Text(
              c.category,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.merge(
                    const TextStyle(
                      fontWeight: FontWeight.bold,
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
            )
            // ListTile(
            //   title: Text(c.category),
            //   //subtitle: Text(c.description),
            //   onTap: () {},
            //   leading: const Icon(Icons.place),
            //   trailing: const Icon(Icons.arrow_forward_ios),
            // ),
          ],
        ),
      )
      //  Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: ListTile(
      //     title: Text(c.category),
      //     subtitle: FutureBuilder(
      //       future: storage.getCategoryUrlImage(c.category),
      //       builder: (context, urlImage) =>
      //           urlImage.data == null ? const LinearProgressIndicator() : Text(urlImage.data!),
      //     ), //c.description),
      //     onTap: () {},
      //     leading: const Icon(Icons.place),
      //     trailing: const Icon(Icons.arrow_forward_ios),
      //   ),
      // ),
      );
}
