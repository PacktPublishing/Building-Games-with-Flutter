import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'george.dart';

class Background extends PositionComponent with Tappable {

  Background(this.george);

  final George george;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    position = Vector2(0, 0);
    size = Vector2(1600, 1600);
  }

  @override
  bool onTapUp(TapUpInfo info) {
    george.moveToLocation(info);
    return true;
  }
}