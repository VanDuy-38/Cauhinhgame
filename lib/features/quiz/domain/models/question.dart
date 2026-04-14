class Question {
  const Question({
    required this.categoryId,
    required this.text,
    required this.options,
    required this.correctIndex,
  });

  final String categoryId;
  final String text;
  final List<String> options;
  final int correctIndex;
}
