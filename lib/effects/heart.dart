import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class HeartEffect extends FlameGame {
  @override
  Future<void> onLoad() async {
    add(
      HeartIcon()
        ..add(
          ScaleEffect.to(
            Vector2.all(1.4),
            InfiniteEffectController(
              SequenceEffectController(
                [
                  CurvedEffectController(0.4, Curves.bounceOut),
                  PauseEffectController(0.5, progress: 1),
                  ReverseCurvedEffectController(0.4, Curves.bounceIn)
                ],
              ),
            ),
          ),
        ),
    );
  }
}

class HeartIcon extends PositionComponent {
  HeartIcon() {
    double width = 60;
    double height = 60;
    shape = Path()
      ..moveTo(0.5 * width, height * 0.35)
      ..cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
          0.5 * width, height)
      ..moveTo(0.5 * width, height * 0.35)
      ..cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
          0.5 * width, height);
    shape.close();
  }

  late final Path shape;
  late final Paint paint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.fill
    ..strokeWidth = 0;

  @override
  void render(Canvas canvas) {
    canvas.drawPath(shape, paint);
  }
}
