import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/firebase/firestore_providers.dart';
import 'package:inteligivel/util/app_exception.dart';

abstract class BaseStorageRepositories {
  Future<String> getURLbyRef(String pathReference);
}

final storageRepositoryProvider = Provider<StorageRepository>((ref) => StorageRepository(ref));

class StorageRepository implements BaseStorageRepositories {
  final Ref ref;

  const StorageRepository(this.ref);

  @override
  Future<String> getURLbyRef(String pathReference) async {
    try {
      final storage = ref.read(firestoreProvider);
      return await storage.ref(pathReference).getDownloadURL();
    } catch (e) {
      throw AppException(inception: runtimeType, message: e.toString());
    }
  }
}
