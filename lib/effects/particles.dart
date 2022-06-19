import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';

class ParticlesEffect extends FlameGame with HasDraggables {
  final random = Random();
  final Tween<double> noise = Tween(begin: -1, end: 1);
  final ColorTween colorTween;
  final double zoom = 1;

  ParticlesEffect()
      : colorTween = ColorTween(begin: Colors.yellow, end: Colors.orange);

  final _particlesCount = 70;

  @override
  Future<void> onLoad() async {
    camera.followVector2(Vector2.zero());

    camera.zoom = zoom;

    final regularTextStyle =
        TextStyle(fontSize: 8, color: BasicPalette.white.color);
    final regular = TextPaint(style: regularTextStyle);
    add(
      TextComponent(text: "Particles: $_particlesCount ", textRenderer: regular)
        ..anchor = Anchor.topRight
        ..x = size.x / 2
        ..y = -size.y / 2 + 8,
    );
  }

  @override
  void onDragUpdate(int pointerId, DragUpdateInfo info) {
    add(
      ParticleSystemComponent(
        position: info.eventPosition.game,
        particle: Particle.generate(
          count: _particlesCount,
          generator: (i) {
            return AcceleratedParticle(
              lifespan: 30,
              speed: Vector2(
                    noise.transform(random.nextDouble()),
                    noise.transform(random.nextDouble()),
                  ) *
                  i.toDouble(),
              child: CircleParticle(
                radius: 0.6,
                paint: Paint()
                  ..color = colorTween.transform(random.nextDouble())!,
              ),
            );
          },
        ),
      ),
    );

    super.onDragUpdate(pointerId, info);
  }
}
