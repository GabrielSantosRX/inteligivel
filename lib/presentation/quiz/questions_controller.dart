/*
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/data/repositories/categories_repository.dart';
import 'package:inteligivel/domain/models/category/category_model.dart';
import 'package:inteligivel/domain/models/question/question_model.dart';
import 'package:inteligivel/presentation/auth/auth_controller.dart';
import 'package:inteligivel/util/app_exception.dart';

enum QuestionsFilter {
  all,
  obtained,
}

final questionsFilterProvider =
    StateProvider<QuestionsFilter>((_) => QuestionsFilter.all);

final questionsByCategoryProvider = Provider<List<Question>>((ref) {
  final questionsFilterState = ref.watch(questionsFilterProvider).state;
  final questionState = ref.watch(categoryListControllerProvider);
  return questionState.maybeWhen(
    data: (categoryList) {
      switch (questionsFilterState) {
        case QuestionsFilter.obtained:
          return categoryList.where((c) => c.obtained).toList();
        default:
          return categoryList;
      }
    },
    orElse: () => [],
  );
});

final categoriesExceptionProvider = StateProvider<AppException?>((_) => null);

final categoryListControllerProvider =
    StateNotifierProvider<CategoriesController, AsyncValue<List<Category>>>(
  (ref) {
    final user = ref.watch(authControllerProvider);
    return CategoriesController(ref.read, user?.uid);
  },
);

class CategoriesController extends StateNotifier<AsyncValue<List<Category>>> {
  final Ref ref;
  final String? categoryTitle;

  CategoriesController(this.ref, this.categoryTitle) : super(AsyncValue.loading()) {
    if (categoryTitle != null) {
      retrieveItems();
    }
  }

  Future<void> retrieveItems({bool isRefreshing = false}) async {
    if (isRefreshing) state = AsyncValue.loading();
    try {
      final items =
          await ref.read(categoriesRepositoryProvider).getAllCategories()
          .retrieveItems(userId: _userId!);
      if (mounted) {
        state = AsyncValue.data(items);
      }
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addItem({required String name, bool obtained = false}) async {
    try {
      final item = Item(name: name, obtained: obtained);
      final itemId = await _read(itemRepositoryProvider).createItem(
        userId: _userId!,
        item: item,
      );
      state.whenData((items) =>
          state = AsyncValue.data(items..add(item.copyWith(id: itemId))));
    } on CustomException catch (e) {
      _read(categoriesExceptionProvider).state = e;
    }
  }

  Future<void> updateItem({required Item updatedItem}) async {
    try {
      await _read(itemRepositoryProvider)
          .updateItem(userId: _userId!, item: updatedItem);
      state.whenData((items) {
        state = AsyncValue.data([
          for (final item in items)
            if (item.id == updatedItem.id) updatedItem else item
        ]);
      });
    } on CustomException catch (e) {
      _read(categoriesExceptionProvider).state = e;
    }
  }

  Future<void> deleteItem({required String itemId}) async {
    try {
      await _read(itemRepositoryProvider).deleteItem(
        userId: _userId!,
        itemId: itemId,
      );
      state.whenData((items) => state =
          AsyncValue.data(items..removeWhere((item) => item.id == itemId)));
    } on CustomException catch (e) {
      _read(categoriesExceptionProvider).state = e;
    }
  }
}
*/