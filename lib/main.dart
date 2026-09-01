import 'package:flutter/material.dart';

import 'navigation/app_router.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const ConectaLactareApp());
}


class ConectaLactareApp extends StatelessWidget {
  const ConectaLactareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Conecta Lactare',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}
