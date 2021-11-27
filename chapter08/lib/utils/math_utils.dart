import 'dart:math';
import 'package:flame/extensions.dart';

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

Rect getGameScreenBounds(Vector2 canvasSize) {
  double left = 0, right = 0, top = 0, bottom = 0;

  if (canvasSize.x > 1600) {
    left = (canvasSize.x - 1600) / 2;
  }
  if (canvasSize.y > 1600) {
    top = (canvasSize.y - 1600) / 2;
  }

  if (canvasSize.x < 1600) {
    right = canvasSize.x;
  } else {
    right = left + 1600;
  }

  if (canvasSize.y < 1600) {
    bottom = canvasSize.y;
  } else {
    bottom = top + 1600;
  }

  return Rect.fromLTRB(left, top, right, bottom);
}