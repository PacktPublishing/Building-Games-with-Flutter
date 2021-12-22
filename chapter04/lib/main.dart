import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:goldrush/components/zombie.dart';
import 'package:goldrush/components/skeleton.dart';
import 'components/background.dart';
import 'components/george.dart';

void main() async {
  // Create an instance of the game
  final goldRush = GoldRush();

  // Setup Flutter widgets and start the game in full screen portrait orientation
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setPortrait();
  
  // Run the app, passing the games widget here
  runApp(
    GameWidget(game: goldRush)
  );
}

class GoldRush extends FlameGame with HasCollidables {

  @override
  Future<void> onLoad() async {
    super.onLoad();
    
    add(Background());
    add (George(position: Vector2(200, 400), size: Vector2(48.0, 48.0), speed: 40.0));
    add (Zombie(position: Vector2(100, 200), size: Vector2(32.0, 64.0), speed: 20.0));
    add (Zombie(position: Vector2(300, 200), size: Vector2(32.0, 64.0), speed: 20.0));
    add (Skeleton(position: Vector2(100, 600), size: Vector2(32.0, 64.0), speed: 60.0));
    add (Skeleton(position: Vector2(300, 600), size: Vector2(32.0, 64.0), speed: 60.0));
    add(ScreenCollidable());
  }
}