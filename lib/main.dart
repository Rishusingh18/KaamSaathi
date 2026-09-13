import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/language_selection_screen.dart';
void main() {
  runApp(const SahyogApp());
}

class SahyogApp extends StatelessWidget {
  const SahyogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sahyog',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LanguageSelectionScreen(),
    );
  }
}
