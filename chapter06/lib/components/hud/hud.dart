import 'package:flame/components.dart';
import 'package:goldrush/components/hud/run_button.dart';
import 'package:goldrush/components/hud/score_text.dart';
import 'package:goldrush/components/hud/joystick.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class HudComponent extends PositionComponent {

  HudComponent() : super(priority: 20);
  
  late Joystick joystick;
  late RunButton runButton;
  late ScoreText scoreText;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    final joystickKnobPaint = BasicPalette.blue.withAlpha(200).paint();
    final joystickBackgroundPaint = BasicPalette.blue.withAlpha(100).paint();
    final buttonRunPaint = BasicPalette.red.withAlpha(200).paint();
    final buttonDownRunPaint = BasicPalette.red.withAlpha(100).paint();

    joystick = Joystick(
      knob: CircleComponent(radius: 20.0, paint: joystickKnobPaint),
      background: CircleComponent(radius: 40.0, paint: joystickBackgroundPaint),
      margin: const EdgeInsets.only(left: 40, bottom: 40),
    );

    runButton = RunButton(
      button: CircleComponent(radius: 25.0, paint: buttonRunPaint),
      buttonDown: CircleComponent(radius: 25.0, paint: buttonDownRunPaint),
      margin: const EdgeInsets.only(right: 20, bottom: 50),
      onPressed: () => {}
    );

    scoreText = ScoreText(margin: const EdgeInsets.only(left: 40, top: 60));

    add(joystick);
    add(runButton);
    add(scoreText);
  }
}