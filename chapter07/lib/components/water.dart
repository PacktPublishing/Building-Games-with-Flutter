import 'package:flame/components.dart';
import 'package:flame/geometry.dart';

class Water extends PositionComponent with HasHitboxes, Collidable {

  Water({required Vector2 position, required Vector2 size, required this.id}) : super(position: position, size: size);
  
  int id;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    
    collidableType = CollidableType.passive;
    
    addHitbox(HitboxRectangle());
  }
}