import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:musikapp/app/router.dart';
import 'package:musikapp/app/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}