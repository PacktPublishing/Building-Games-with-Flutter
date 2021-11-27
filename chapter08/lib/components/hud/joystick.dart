import 'package:flame/components.dart';

class Joystick extends JoystickComponent {

  Joystick({required PositionComponent knob, PositionComponent? background, Vector2? position}) : super (knob: knob, background: background, position: position);
}