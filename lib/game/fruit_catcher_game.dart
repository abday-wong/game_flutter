import 'dart:math';
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

import 'components/basket.dart';
import 'components/fruit.dart';
import 'managers/audio_manager.dart';

class FruitCatcherGame extends FlameGame with PanDetector, HasCollisionDetection {
  late Basket basket;
  final Random random = Random();

  double fruitSpawnTimer = 0;
  final double fruitSpawnInterval = 1.5;

  final ValueNotifier<int> scoreNotifier = ValueNotifier<int>(0);
  int _score = 0;
  int get score => _score;
  set score(int value) {
    _score = value;
    scoreNotifier.value = value;
  }

  bool _isGameOver = false;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Initialize audio
    await AudioManager().initialize();
    AudioManager().playBackgroundMusic();

    // Add basket
    basket = Basket()
      ..position = Vector2(size.x / 2, size.y - 100); 
    await add(basket);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (_isGameOver) return;

    fruitSpawnTimer += dt;
    if (fruitSpawnTimer >= fruitSpawnInterval) {
      spawnFruit();
      fruitSpawnTimer = 0;
    }
  }

  void spawnFruit() {
    final x = random.nextDouble() * size.x;
    final fruit = Fruit(position: Vector2(x, -50));
    add(fruit);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    if (_isGameOver) return;

    basket.position.x += info.delta.global.x;
    basket.position.x = basket.position.x.clamp(
      basket.size.x / 2,
      size.x - basket.size.x / 2,
    );
  }

  void incrementScore() {
    if (_isGameOver) return;

    score++;
    AudioManager().playSfx('collect.mp3');
  }

  void gameOver() {
    if (_isGameOver) return;

    _isGameOver = true;
    AudioManager().playSfx('explosion.mp3');
    AudioManager().stopBackgroundMusic();
    pauseEngine();
    print('GAME OVER! Final score: $score');
  }

  @override
  void onRemove() {
    AudioManager().stopBackgroundMusic();
    super.onRemove();
  }

  @override
  Color backgroundColor() => const Color(0xFF87CEEB);
}
