import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:inteligivel/data/repositories/storage_repository.dart';
import 'package:inteligivel/firebase/firestore_path.dart';

final storageControllerProvider = StateNotifierProvider<StorageController, void>(
  (ref) => StorageController(ref),
);

class StorageController extends StateNotifier<AsyncValue<void>> {
  final Ref ref;

  StorageController(this.ref) : super(const AsyncData(null));

  @override
  void dispose() {
    super.dispose();
  }

  Future<String> getCategoryUrlImage(String category) async {
    final pathReference = FirestorePath.imgCategory(category);
    final storage = ref.read(storageRepositoryProvider);

    final data = await AsyncValue.guard(() => storage.getURLbyRef(pathReference));

    return data.when(
      loading: () => FirestorePath.imgFallback(),
      error: (error, _) => FirestorePath.imgFallback(),
      data: (url) => url,
    );
  }
}
