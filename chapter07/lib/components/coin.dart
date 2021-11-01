import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/geometry.dart';
import 'package:flame/sprite.dart';

class Coin extends SpriteAnimationComponent with Hitbox, Collidable {

  Coin({required Vector2 position, required Vector2 size}) : super(position: position, size: size);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    
    collidableType = CollidableType.passive;
    
    var spriteImages = await Flame.images.load('coins.png');
    final spriteSheet = SpriteSheet(image: spriteImages, srcSize: size);

    animation = spriteSheet.createAnimation(row: 0, stepTime: 0.1, from: 0, to: 7);
    addHitbox(HitboxRectangle());
  }
}