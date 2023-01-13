import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:inteligivel/routes.dart';
import 'package:inteligivel/util/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const InteligivelApp());
}

class InteligivelApp extends StatelessWidget {
  const InteligivelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'Inteligível',
        theme: appTheme,
        routerConfig: routes,
      ),
    );
  }
}
