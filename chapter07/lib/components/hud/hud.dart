import 'package:flame/components.dart';
import 'package:goldrush/components/hud/run_button.dart';
import 'package:goldrush/components/hud/score_text.dart';
import 'package:goldrush/components/hud/joystick.dart';
import 'package:flame/palette.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart';

class HudComponent extends PositionComponent {

  HudComponent() : super(priority: 10);

  late Joystick joystick;
  late RunButton runButton;
  late ScoreText scoreText;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    
    isHud = true;
    
    final joystickKnobPaint = BasicPalette.blue.withAlpha(200).paint();
    final joystickBackgroundPaint = BasicPalette.blue.withAlpha(100).paint();
    final buttonRunPaint = BasicPalette.red.withAlpha(200).paint();
    final buttonDownRunPaint = BasicPalette.red.withAlpha(100).paint();

    joystick = Joystick(
      knob: Circle(radius: 20).toComponent(paint: joystickKnobPaint),
      background: Circle(radius: 40).toComponent(paint: joystickBackgroundPaint),
      margin: const EdgeInsets.only(left: 40, bottom: 40),
    );

    runButton = RunButton(
      button: Circle(radius: 25).toComponent(paint: buttonRunPaint),
      buttonDown: Circle(radius: 25).toComponent(paint: buttonDownRunPaint),
      margin: const EdgeInsets.only(right: 20, bottom: 50),
      onPressed: () => {}
    );

    scoreText = ScoreText(margin: const EdgeInsets.only(left: 40, top: 60));

    add(joystick);
    add(runButton);
    add(scoreText);
  }
}