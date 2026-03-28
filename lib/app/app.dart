import 'package:flutter/material.dart';
import 'package:smartpayut_mobile/app/router.dart';
import 'package:smartpayut_mobile/core/theme/app_theme.dart';

class SmartPayUtApp extends StatelessWidget {
  const SmartPayUtApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SmartPayUT Mobile',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}