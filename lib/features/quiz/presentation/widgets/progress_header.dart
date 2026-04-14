import 'package:flutter/material.dart';

class ProgressHeader extends StatelessWidget {
  const ProgressHeader({
    super.key,
    required this.current,
    required this.total,
    required this.score,
  });

  final int current;
  final int total;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF6C63FF).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'CÂU HỎI $current / $total',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF6C63FF),
                  letterSpacing: 1.2,
                ),
              ),
            ),
            Row(
              children: [
                const Icon(Icons.stars_rounded, color: Colors.amber, size: 20),
                const SizedBox(width: 6),
                Text(
                  '$score ĐIỂM',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: current / total,
            minHeight: 10,
            backgroundColor: Colors.white.withOpacity(0.05),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF6C63FF)),
          ),
        ),
      ],
    );
  }
}
