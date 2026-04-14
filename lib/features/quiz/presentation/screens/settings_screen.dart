import 'package:flutter/material.dart';

import '../controllers/quiz_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, required this.controller});

  final QuizController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(title: const Text('Cấu hình game đố vui')),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SettingLine(
                  title: 'Âm thanh',
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: controller.soundEnabled,
                        onChanged: (value) =>
                            controller.updateSound(value ?? true),
                      ),
                      const Text('Bật'),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                _SettingLine(
                  title: 'Điểm cao nhất',
                  trailing: Text(
                    '${controller.highScore}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 12),
                _SettingLine(
                  title: 'Tự động lưu game',
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: controller.autoSaveEnabled,
                        onChanged: (value) =>
                            controller.updateAutoSave(value ?? true),
                      ),
                      const Text('Bật'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text('Volume', style: Theme.of(context).textTheme.titleMedium),
                Slider(
                  value: controller.volume,
                  onChanged: controller.updateVolume,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SettingLine extends StatelessWidget {
  const _SettingLine({required this.title, required this.trailing});

  final String title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        trailing,
      ],
    );
  }
}
