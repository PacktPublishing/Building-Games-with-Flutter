import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:goldrush/utils/math_utils.dart';
import 'package:flame/extensions.dart';

// Base class for all our sprites
class Character extends SpriteAnimationComponent with Hitbox, Collidable {

  Character({required Vector2 position, required Vector2 size, required double speed}) {
      this.position = position;
      this.size = size;
      this.speed = speed;
  }

  late SpriteAnimation downAnimation, leftAnimation, upAnimation, rightAnimation;
  late double speed;
  double elapsedTime = 0.0;
  int currentDirection = down;
  static const int down = 0, left = 1, up = 2, right = 3;
  late Vector2 originalPosition;

  void onPaused() {}
  void onResumed() {}

  @override
  void onGameResize(Vector2 canvasSize) {
    super.onGameResize(canvasSize);

    Rect gameScreenBounds = getGameScreenBounds(canvasSize);
    position = Vector2(originalPosition.x + gameScreenBounds.left, originalPosition.y + gameScreenBounds.top);
  }
}

extension CreateAnimationByColumn on SpriteSheet {

    SpriteAnimation createAnimationByColumn({
      required int column,
      required double stepTime,
      bool loop = true,
      int from = 0,
      int? to,
    }) {
    to ??= columns;

    final spriteList = List<int>.generate(to - from, (i) => from + i)
      .map((e) => getSprite(e, column))
      .toList();

    return SpriteAnimation.spriteList(
      spriteList,
      stepTime: stepTime,
      loop: loop,
    );
  }
}