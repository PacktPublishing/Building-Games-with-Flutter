import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'dart:ui';
import 'package:goldrush/utils/math_utils.dart';
import 'package:goldrush/utils/effects.dart';

class Coin extends SpriteAnimationComponent {

  Coin({required Vector2 position, required Vector2 size}) :
    originalPosition = position,
    super(position: position, size: size);

  late Vector2 originalPosition;
  late ShadowLayer shadowLayer;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    

    var spriteImages = await Flame.images.load('coins.png');
    final spriteSheet = SpriteSheet(image: spriteImages, srcSize: size);

    animation = spriteSheet.createAnimation(row: 0, stepTime: 0.1, from: 0, to: 7);
    add(RectangleHitbox(collisionType: CollisionType.passive));

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



