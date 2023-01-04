import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:inteligivel/data/repositories/auth_repository.dart';

class AuthController extends StateNotifier<AsyncValue<void>> {
  final Ref ref;

  AuthController(
    this.ref,
  ) : super(const AsyncData(null)) {
    //_authStateChangesSubscription?.cancel();
    //_authStateChangesSubscription = ref.read(authRepositoryProvider).authStateChanges.listen((user) => state = user);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void appStarted() async {
    final user = ref.read(authRepositoryProvider).getCurrentUser();
    if (user == null) {
      await signInAnonymously();
    }
  }

  Future<void> signInAnonymously() async {
    // read the repository using ref
    final authRepository = ref.read(authRepositoryProvider);
    // set the loading state
    state = const AsyncLoading() as AsyncData<User?>;
    // sign in and update the state (data or error)
    state = await AsyncValue.guard(authRepository.singInAnonymously);
  }

  User? get user => ref.read(authRepositoryProvider).getCurrentUser();

  void signOut() async {
    await ref.read(authRepositoryProvider).singOut();
  }
}

final authControllerProvider = StateNotifierProvider<AuthController, void>(
  (ref) => AuthController(ref)..appStarted(),
);
