import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:goldrush/utils/math_utils.dart';
import 'dart:ui';

class Water extends PositionComponent with Hitbox, Collidable {
  
  Water({required Vector2 position, required Vector2 size, required this.id}) :
    originalPosition = position,
    super(position: position, size: size);

  late Vector2 originalPosition;
  
  int id;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    
    collidableType = CollidableType.passive;
    
    addHitbox(HitboxRectangle());
  }

  @override
  void onGameResize(Vector2 canvasSize) {
    super.onGameResize(canvasSize);

    Rect gameScreenBounds = getGameScreenBounds(canvasSize);
    position = Vector2(originalPosition.x + gameScreenBounds.left, originalPosition.y + gameScreenBounds.top);
  }
}

class Object extends SpriteAnimationComponent {
  
}