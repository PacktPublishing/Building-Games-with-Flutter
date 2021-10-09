
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import 'components/player.dart';

void main() async {
  // Create an instance of the game
  final myGame = MyGame();
  
  // Setup Flutter widgets and start the game in full screen portrait orientation
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setPortrait();
  
  
  // Run the app, passing the games widget here
  runApp(
    GameWidget(game: myGame)
  );
}

class MyGame extends BaseGame with HasCollidables {

  @override
  Future<void> onLoad() async {
    add(Player());
    add(ScreenCollidable());
  }
}