import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passion_purpose/core/theme/theme.dart';
import 'package:passion_purpose/features/auth/presentation/pages/auth_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passion Purpose',
      theme: AppTheme.lightTheme,
      home: const AuthScreen(),
    );
  }
}
