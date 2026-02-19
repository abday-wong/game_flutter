import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../fruit_catcher_game.dart';
import 'basket.dart';

enum FruitType { apple, banana, orange, strawberry }

class Fruit extends PositionComponent
    with HasGameRef<FruitCatcherGame>, CollisionCallbacks {

  final FruitType type;
  final double fallSpeed = 200;
  final Random random = Random();

  Fruit({super.position})
      : type = FruitType.values[
            Random().nextInt(FruitType.values.length)],
        super(size: Vector2.all(40));

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    anchor = Anchor.center;

    // Tambah hitbox untuk collision
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Gerak turun
    position.y += fallSpeed * dt;

    // Hapus kalau keluar layar
    if (position.y > gameRef.size.y + 50) {
      removeFromParent();
    }
  }

  @override
  void onCollision(
      Set<Vector2> intersectionPoints,
      PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is Basket) {
      gameRef.incrementScore();
      removeFromParent();
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final paint = Paint()
      ..style = PaintingStyle.fill;

    switch (type) {
      case FruitType.apple:
        paint.color = Colors.red;
        break;
      case FruitType.banana:
        paint.color = Colors.yellow;
        break;
      case FruitType.orange:
        paint.color = Colors.orange;
        break;
      case FruitType.strawberry:
        paint.color = Colors.pink;
        break;
    }

    // Gambar buah (lingkaran)
    canvas.drawCircle(
      Offset(size.x / 2, size.y / 2),
      size.x / 2,
      paint,
    );

    // Efek shine
    final shinePaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.x / 2 - 5, size.y / 2 - 5),
      size.x / 5,
      shinePaint,
    );
  }
}
