class QuizCategory {
  const QuizCategory({
    required this.id,
    required this.title,
    required this.questionCount,
    required this.playCount,
    required this.thumbnail,
  });

  final String id;
  final String title;
  final int questionCount;
  final int playCount;
  final String thumbnail;
}
