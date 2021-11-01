import 'dart:math';
import 'package:flame/components.dart';
  
double getAngle(Vector2 origin, Vector2 target) {
  double dx = target.x - origin.x;
  double dy = -(target.y - origin.y);

  double angleInRadians = atan2(dy, dx);

  if (angleInRadians < 0) {
    angleInRadians = angleInRadians.abs();
  }
  else {
    angleInRadians = 2 * pi - angleInRadians;
  }

  return angleInRadians * radians2Degrees;
}
