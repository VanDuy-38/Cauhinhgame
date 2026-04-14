import '../domain/models/question.dart';
import '../domain/models/quiz_category.dart';
import 'question_bank.dart';
import 'quiz_category_bank.dart';

abstract class QuizRepository {
  List<Question> fetchQuestions({String? categoryId});
  List<QuizCategory> fetchCategories();
}

class LocalQuizRepository implements QuizRepository {
  const LocalQuizRepository();

  @override
  List<Question> fetchQuestions({String? categoryId}) {
    if (categoryId == null) {
      return List<Question>.from(questionBank);
    }

    return questionBank.where((q) => q.categoryId == categoryId).toList();
  }

  @override
  List<QuizCategory> fetchCategories() {
    return List<QuizCategory>.from(quizCategoryBank);
  }
}
