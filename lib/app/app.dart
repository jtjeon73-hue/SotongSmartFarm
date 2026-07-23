import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import 'router.dart';

class SotongSmartFarmApp extends StatelessWidget {
  SotongSmartFarmApp({super.key});

  final _router = createRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SotongSmartFarm',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routerConfig: _router,
    );
  }
}
