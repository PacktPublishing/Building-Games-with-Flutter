import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart';
import 'package:flame/palette.dart';

class Player extends PositionComponent with HasHitboxes, Collidable {

  static const int squareSpeed = 250; // The speed that our square will animate
  static final squarePaint = BasicPalette.green.paint(); // The color of the square
  static final squareWidth = 100.0, squareHeight = 100.0; // The width and height of our square will be 100 x 100

  // The direction our square is travelling in, 1 for left to right, -1 for right to left
  int squareDirection = 1;
  late double screenWidth, screenHeight, centerX, centerY;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Get the width and height of our screen canvas
    screenWidth = MediaQueryData.fromWindow(window).size.width;
    screenHeight = MediaQueryData.fromWindow(window).size.height;

    // Calculate the center of the screen, allowing for the adjustment for the squares size
    centerX = (screenWidth / 2) - (squareWidth / 2);
    centerY = (screenHeight / 2) - (squareHeight / 2);

    // Set the initial position of the green square at the center of the screen with a size of 100 width and height
    position = Vector2(centerX, centerY);
    size = Vector2(squareWidth, squareHeight);

    addHitbox(HitboxRectangle());
  }

  @override
  void onCollision(Set<Vector2> points, Collidable other) {
    if (other is ScreenCollidable) {
      if (squareDirection == 1) {
        squareDirection = -1;
      } else {
        squareDirection = 1;
      }
    }
  }

  @override
  void update(double deltaTime) {
    super.update(deltaTime);

    // Update the x position of the square based on the speed and direction and the time elapsed
    position.x += squareSpeed * squareDirection * deltaTime;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    renderHitboxes(canvas, paint: squarePaint);
  }
}
