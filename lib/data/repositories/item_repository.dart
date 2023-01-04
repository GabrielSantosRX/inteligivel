import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/domain/models/item/item_model.dart';
import 'package:inteligivel/firebase/firebase_providers.dart';
import 'package:inteligivel/firebase/firebase_firestore_extension.dart';

abstract class BaseItemRepository {
  Future<List<Item>> getItems({required String userId});
  Future<String> createItem({required String userId, required Item item});
  Future<void> updateItem({required String userId, required Item item});
  Future<void> deleteItem({required String userId, required String itemId});
}

final itemRepositoryProvider = Provider<ItemRepository>((ref) => ItemRepository(ref));

class ItemRepository implements BaseItemRepository {
  final Ref ref;

  const ItemRepository(this.ref);

  @override
  Future<List<Item>> getItems({required String userId}) async {
    final snap = await ref.read(firebaseFirestoreProvider).usersListRef(userId).get();

    return snap.docs.map((doc) => Item.fromDocument(doc)).toList();
  }

  @override
  Future<String> createItem({required String userId, required Item item}) async {
    final docRef = await ref
        .read(firebaseFirestoreProvider)
        .collection('lists')
        .doc(userId)
        .collection('userList')
        .add(item.toDocument());

    return docRef.id;
  }

  @override
  Future<void> updateItem({required String userId, required Item item}) async {
    await ref
        .read(firebaseFirestoreProvider)
        .collection('lists')
        .doc(userId)
        .update(item.toDocument());
  }

  @override
  Future<void> deleteItem({required String userId, required String itemId}) async {
    await ref.read(firebaseFirestoreProvider).collection('lists').doc(userId).delete();
  }
}
