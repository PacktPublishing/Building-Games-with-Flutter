import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class RunButton extends HudButtonComponent {

  RunButton({
    required button,
    buttonDown, 
    EdgeInsets? margin,
    Vector2? position,
    Vector2? size,
    Anchor anchor = Anchor.center,
    onPressed,
  }) : super(
    button: button,
    buttonDown: buttonDown,
    margin: margin,
    position: position,
    size: size ?? button.size,
    anchor: anchor,
    onPressed: onPressed
  );

  bool buttonPressed = false;

  @override
  bool onTapDown(TapDownInfo info) {
    super.onTapDown(info);

    buttonPressed = true;

    return true;
  }

  @override
  bool onTapUp(TapUpInfo info) {
    super.onTapUp(info);

    buttonPressed = false;

    return false;
  }

  @override
  bool onTapCancel() {
    super.onTapCancel();

    buttonPressed = false;

    return true;
  }
}