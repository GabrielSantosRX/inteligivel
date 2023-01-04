import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inteligivel/firebase/firebase_providers.dart';

abstract class BaseAuthRepositories {
  Stream<User?> get authStateChanges;

  Future<void> singInAnonymously();
  User? getCurrentUser();
  Future<void> singOut();
}

final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository(ref));

class AuthRepository implements BaseAuthRepositories {
  final Ref ref;

  const AuthRepository(this.ref);

  @override
  Stream<User?> get authStateChanges => ref.read(firebaseAuthProvider).authStateChanges();

  @override
  Future<void> singInAnonymously() async {
    await ref.read(firebaseAuthProvider).signInAnonymously();
  }

  @override
  User? getCurrentUser() {
    return ref.read(firebaseAuthProvider).currentUser;
  }

  @override
  Future<void> singOut() async {
    await ref.read(firebaseAuthProvider).signOut();
    singInAnonymously();
  }
}
