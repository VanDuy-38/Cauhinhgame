import 'package:flutter/foundation.dart';

import '../../data/local_quiz_repository.dart';
import '../../domain/models/question.dart';
import '../../domain/models/quiz_category.dart';
import '../services/quiz_sound_service.dart';

class QuizController extends ChangeNotifier {
  QuizController({
    required QuizRepository repository,
    QuizSoundService soundService = const QuizSoundService(),
  }) : _repository = repository,
       _soundService = soundService;

  final QuizRepository _repository;
  final QuizSoundService _soundService;

  bool soundEnabled = true;
  bool autoSaveEnabled = true;
  double volume = 0.4;

  int highScore = 0;
  int score = 0;
  int currentIndex = 0;
  int? selectedIndex;
  QuizCategory? selectedCategory;

  List<Question> _questions = const [];
  List<QuizCategory> _categories = const [];

  List<Question> get questions => _questions;
  List<QuizCategory> get categories => _categories;
  bool get hasStarted => _questions.isNotEmpty;
  bool get isLastQuestion => currentIndex == _questions.length - 1;

  Question get currentQuestion => _questions[currentIndex];

  void loadCategories() {
    _categories = _repository.fetchCategories();
    notifyListeners();
  }

  bool startQuizForCategory(QuizCategory category) {
    final questions = _repository.fetchQuestions(categoryId: category.id);
    if (questions.isEmpty) {
      return false;
    }

    selectedCategory = category;
    _questions = questions..shuffle();
    score = 0;
    currentIndex = 0;
    selectedIndex = null;
    notifyListeners();
    return true;
  }

  bool restartCurrentCategoryQuiz() {
    final category = selectedCategory;
    if (category == null) {
      return false;
    }

    return startQuizForCategory(category);
  }

  void chooseAnswer(int index) {
    if (selectedIndex != null) {
      return;
    }

    selectedIndex = index;
    final isCorrect = index == currentQuestion.correctIndex;
    if (isCorrect) {
      score++;
    }
    _soundService.playAnswer(
      isCorrect: isCorrect,
      enabled: soundEnabled,
      volume: volume,
    );
    notifyListeners();
  }

  bool goToNextQuestion() {
    if (selectedIndex == null) {
      return false;
    }

    if (isLastQuestion) {
      if (score > highScore) {
        highScore = score;
      }
      _soundService.playCompleted(enabled: soundEnabled, volume: volume);
      notifyListeners();
      return true;
    }

    currentIndex++;
    selectedIndex = null;
    notifyListeners();
    return false;
  }

  void updateSound(bool value) {
    soundEnabled = value;
    _soundService.playTap(enabled: soundEnabled, volume: volume);
    notifyListeners();
  }

  void updateAutoSave(bool value) {
    autoSaveEnabled = value;
    notifyListeners();
  }

  void updateVolume(double value) {
    volume = value;
    notifyListeners();
  }
}
