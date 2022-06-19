import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class LearningShapes extends FlameGame {
  @override
  void onMount() {
    final paint1 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0
      ..color = Colors.deepOrange;

    add(RectangleComponent.fromRect(Rect.fromLTWH(30, 0, 4, size.y)));

//     add(RectangleComponent.fromRect(
//         Rect.fromCircle(center: const Offset(0, 0), radius: 50)));

    add(
      RectangleComponent.square(
        size: 20,
        paint: paint1,
        position: Vector2(30, 30),
      )..add(
          MoveEffect.to(
            Vector2(0, 20),
            EffectController(
              duration: 3,
              reverseDuration: 3,
              infinite: true,
              curve: Curves.easeInOut,
            ),
          ),
        ),
    );
    super.onMount();
  }

  final Paint hitboxPaint = BasicPalette.green.paint()
    ..style = PaintingStyle.stroke;
}
