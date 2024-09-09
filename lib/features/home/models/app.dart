import 'package:flutter/material.dart';
import 'package:passion_purpose/core/pages/main_page.dart';
import 'package:passion_purpose/core/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passion Purpose',
      theme: AppTheme.lightTheme,
      home: const MainPage(), // Set MainPage as the home
    );
  }
}
