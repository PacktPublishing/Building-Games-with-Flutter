import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/geometry.dart';
import 'package:flame/sprite.dart';
import 'package:goldrush/components/skeleton.dart';
import 'package:goldrush/components/zombie.dart';
import 'package:goldrush/components/character.dart';

class George extends Character {
  George({required Vector2 position, required Vector2 size, required double speed}) : super(position: position, size: size, speed: speed);

  @override
  Future<void> onLoad() async {
    super.onLoad();

    var spriteImages = await Flame.images.load('george.png');
    final spriteSheet = SpriteSheet(image: spriteImages, srcSize: Vector2(width, height));

    downAnimation = spriteSheet.createAnimationByColumn(column: 0, stepTime: 0.2);
    leftAnimation = spriteSheet.createAnimationByColumn(column: 1, stepTime: 0.2);
    upAnimation = spriteSheet.createAnimationByColumn(column: 2, stepTime: 0.2);
    rightAnimation = spriteSheet.createAnimationByColumn(column: 3, stepTime: 0.2);

    changeDirection();

    addHitbox(HitboxRectangle());
  }

  @override
  void onCollision(Set<Vector2> points, Collidable other) {
    super.onCollision(points, other);

    if (other is Zombie || other is Skeleton) {
      other.removeFromParent();
    }
  }
}
