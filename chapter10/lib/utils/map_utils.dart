import 'package:flame/components.dart';
import 'package:flutter/material.dart';

const  int TILE_SIZE = 32;

Offset worldToGridOffset(Vector2 mapLocation) {
  double x = (mapLocation.x / TILE_SIZE).floor().toDouble();
  double y = (mapLocation.y / TILE_SIZE).floor().toDouble();

  return Offset(x, y);
}

Vector2 gridOffsetToWorld(Offset gridOffset) {
  double x = (gridOffset.dx * TILE_SIZE);
  double y = (gridOffset.dy * TILE_SIZE);

  return Vector2(x, y);
}