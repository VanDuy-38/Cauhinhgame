import 'package:flutter/material.dart';

import '../controllers/quiz_controller.dart';
import '../widgets/answer_option_tile.dart';
import '../widgets/progress_header.dart';
import 'result_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key, required this.controller});

  final QuizController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final question = controller.currentQuestion;
        final title = controller.selectedCategory?.title ?? 'Câu hỏi đố vui';

        return Scaffold(
          appBar: AppBar(
            title: Text(title),
            leading: IconButton(
              icon: const Icon(Icons.close_rounded),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                   ProgressHeader(
                    current: controller.currentIndex + 1,
                    total: controller.questions.length,
                    score: controller.score,
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      question.text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.only(bottom: 20),
                      itemCount: question.options.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        return AnswerOptionTile(
                          text: question.options[index],
                          isSelected: controller.selectedIndex == index,
                          isCorrect: question.correctIndex == index,
                          hasAnswered: controller.selectedIndex != null,
                          onTap: () => controller.chooseAnswer(index),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: controller.selectedIndex == null
                        ? null
                        : () {
                            final isFinished = controller.goToNextQuestion();
                            if (isFinished) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute<void>(
                                  builder: (_) =>
                                      ResultScreen(controller: controller),
                                ),
                              );
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 60),
                    ),
                    child: Text(
                      controller.isLastQuestion
                          ? 'KẾT THÚC'
                          : 'CÂU TIẾP THEO',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
