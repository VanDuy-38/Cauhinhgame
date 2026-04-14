import 'dart:async';

import 'package:flutter/services.dart';

class QuizSoundService {
  const QuizSoundService();

  bool _canPlay(bool enabled, double volume) {
    return enabled && volume > 0;
  }

  void playTap({required bool enabled, required double volume}) {
    if (!_canPlay(enabled, volume)) {
      return;
    }
    unawaited(SystemSound.play(SystemSoundType.click));
  }

  void playAnswer({
    required bool isCorrect,
    required bool enabled,
    required double volume,
  }) {
    if (!_canPlay(enabled, volume)) {
      return;
    }

    final type = isCorrect ? SystemSoundType.click : SystemSoundType.alert;
    unawaited(SystemSound.play(type));
  }

  void playCompleted({required bool enabled, required double volume}) {
    if (!_canPlay(enabled, volume)) {
      return;
    }
    unawaited(SystemSound.play(SystemSoundType.alert));
  }
}
