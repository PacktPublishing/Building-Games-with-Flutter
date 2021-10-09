import 'package:goldrush/components/character.dart';
import 'package:flame/components.dart';
import 'dart:math';

class EnemyCharacter extends Character {
  EnemyCharacter({required Vector2 position, required Vector2 size, required double speed}) : super(position: position, size: size, speed: speed);

  void changeDirection() {
    Random random = new Random();
    int newDirection = random.nextInt(4);

    switch (newDirection) {
      case Character.down:
        animation = downAnimation;
        break;
      case Character.left:
        animation = leftAnimation;
        break;
      case Character.up:
        animation = upAnimation;
        break;
      case Character.right:
        animation = rightAnimation;
        break;
    }

    currentDirection = newDirection;
  }

  @override
  void update(double deltaTime) {
    super.update(deltaTime);

    elapsedTime += deltaTime;
    if (elapsedTime > 3.0) {
      changeDirection();
      elapsedTime = 0.0;
    }

    switch (currentDirection) {
      case Character.down:
        position.y += speed * deltaTime;
        break;
      case Character.left:
        position.x -= speed * deltaTime;
        break;
      case Character.up:
        position.y -= speed * deltaTime;
        break;
      case Character.right:
        position.x += speed * deltaTime;
        break;
    }
  }

  @override
  void onCollision(Set<Vector2> points, Collidable other) {
    if (other is ScreenCollidable) {
      switch (currentDirection) {
        case Character.down:
          currentDirection = Character.up;
          animation = upAnimation;
          break;
        case Character.left:
          currentDirection = Character.right;
          animation = rightAnimation;
          break;
        case Character.up:
          currentDirection = Character.down;
          animation = downAnimation;
          break;
        case Character.right:
          currentDirection = Character.left;
          animation = leftAnimation;
          break;
      }

      elapsedTime = 0.0;
    }
  }
}
