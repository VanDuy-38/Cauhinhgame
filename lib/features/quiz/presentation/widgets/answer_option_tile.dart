import 'package:flutter/material.dart';

class AnswerOptionTile extends StatelessWidget {
  const AnswerOptionTile({
    super.key,
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    required this.hasAnswered,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool hasAnswered;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    Color borderColor = Colors.white.withOpacity(0.1);
    Color backgroundColor = Colors.white.withOpacity(0.05);
    Color textColor = Colors.white;

    if (hasAnswered) {
      if (isCorrect) {
        borderColor = Colors.greenAccent;
        backgroundColor = Colors.greenAccent.withOpacity(0.1);
        textColor = Colors.greenAccent;
      } else if (isSelected) {
        borderColor = Colors.redAccent;
        backgroundColor = Colors.redAccent.withOpacity(0.1);
        textColor = Colors.redAccent;
      }
    } else if (isSelected) {
      borderColor = const Color(0xFF6C63FF);
      backgroundColor = const Color(0xFF6C63FF).withOpacity(0.1);
    }

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: hasAnswered ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 2),
          color: backgroundColor,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: textColor,
                ),
              ),
            ),
            if (hasAnswered && isCorrect)
              const Icon(Icons.check_circle_rounded, color: Colors.greenAccent),
            if (hasAnswered && isSelected && !isCorrect)
              const Icon(Icons.cancel_rounded, color: Colors.redAccent),
          ],
        ),
      ),
    );
  }
}
