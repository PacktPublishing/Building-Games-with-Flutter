import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'components/player.dart';

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

    add(Player());
    add(ScreenCollidable());
  }
}