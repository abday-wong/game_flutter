import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game_fruit_catcher/game/managers/audio_manager.dart';

class FruitCatcherGame extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF87CEEB);

  final ValueNotifier<int> score = ValueNotifier<int>(0);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    AudioManager().playBackgroundMusic();
  }
}
