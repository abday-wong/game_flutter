import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game_fruit_catcher/game/managers/audio_manager.dart';

class FruitCatcherGame extends FlameGame {
  @override
  Color backgroundColor() => const Color.fromARGB(255, 234, 236, 237);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
  }
}
