import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../shared/values/app_theme.dart';
import 'di/register_dependencies.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: getIt<GoRouter>(),
      debugShowCheckedModeBanner: false,
      title: 'FindX',
      theme: AppTheme.darkTheme,
    );
  }
}
