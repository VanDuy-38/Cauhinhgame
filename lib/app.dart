import 'package:flutter/material.dart';

import 'features/quiz/data/local_quiz_repository.dart';
import 'features/quiz/presentation/controllers/quiz_controller.dart';
import 'features/quiz/presentation/screens/home_screen.dart';

class QuizApp extends StatelessWidget {
  QuizApp({super.key})
    : controller = QuizController(repository: const LocalQuizRepository()) {
    controller.loadCategories();
  }

  final QuizController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Vui',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
          brightness: Brightness.dark,
          surface: const Color(0xFF1A1A2E),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF1A1A2E),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
          bodyLarge: TextStyle(color: Colors.white70),
          bodyMedium: TextStyle(color: Colors.white60),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6C63FF),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: HomeScreen(controller: controller),
    );
  }
}
