import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/domain/models/category/category_model.dart';
import 'package:inteligivel/firebase/firebase_providers.dart';
import 'package:inteligivel/util/app_exception.dart';

abstract class BaseCategoriesRepository {
  Future<List<Category>> getAllCategories();
}

final categoriesRepositoryProvider =
    Provider<CategoriesRepository>((ref) => CategoriesRepository(ref));

class CategoriesRepository implements BaseCategoriesRepository {
  final Ref ref;

  const CategoriesRepository(this.ref);

  @override
  Future<List<Category>> getAllCategories() async {
    try {
      final snap = await ref.read(firebaseFirestoreProvider).collection('categories').get();
      return snap.docs.map((doc) => Category.fromDocument(doc)).toList();
    } catch (e) {
      throw AppException(inception: runtimeType, message: e.toString());
    }
  }
}
