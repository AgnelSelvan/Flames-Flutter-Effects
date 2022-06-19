import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class HeartEffect extends FlameGame {
  @override
  Future<void> onLoad() async {
    add(
      Heart(anchor: Anchor.center, position: size / 2)
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

class Heart extends SpriteComponent {
  Heart({Anchor? anchor, Vector2? position})
      : super(anchor: anchor, position: position);
  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load("heart.png");
    size = Vector2.all(64);

    return super.onLoad();
  }
}
