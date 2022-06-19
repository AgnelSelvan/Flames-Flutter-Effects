import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flames_flutter_effects/effects/particles.dart';
import 'package:flutter/material.dart';
import './effects/heart.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  runApp(
    GameWidget(
      game: HeartEffect(),
    ),
  );
}
