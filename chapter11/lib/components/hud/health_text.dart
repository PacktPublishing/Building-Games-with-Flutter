import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/cupertino.dart';

class HealthText extends HudMarginComponent {

  HealthText({Vector2? position}) : super (position: position);

  int health = 100;
  String healthText = "Health: ";

  late TextPaint _regularPaint;
  late TextComponent healthTextComponent;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    TextStyle textStyle = TextStyle(color: BasicPalette.blue.color, fontSize: 30.0);
    _regularPaint = TextPaint(style: textStyle);
    healthTextComponent = TextComponent(text: healthText + health.toString(), textRenderer: _regularPaint);

    add(healthTextComponent);
  }

  setHealth(int health) {
    this.health = health;
    healthTextComponent.text = healthText + this.health.toString();
  }
}