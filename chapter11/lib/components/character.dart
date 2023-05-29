import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:goldrush/utils/math_utils.dart';
import 'package:flame/extensions.dart';
import 'package:goldrush/utils/effects.dart';

class Character extends SpriteAnimationComponent with CollisionCallbacks {

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
  late ShadowLayer shadowLayer;

  void onPaused() {}
  void onResumed() {}

  @override
  Future<void> onLoad() async {
    super.onLoad();

    shadowLayer = ShadowLayer(super.render);
  }

  @override
  void onGameResize(Vector2 canvasSize) {
    super.onGameResize(canvasSize);

    Rect gameScreenBounds = getGameScreenBounds(canvasSize);
    position = Vector2(originalPosition.x + gameScreenBounds.left, originalPosition.y + gameScreenBounds.top);    
  }

  @override
  // ignore: must_call_super
  void render(Canvas canvas) {
    shadowLayer.render(canvas);
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