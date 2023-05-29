# Migration to the latest version of flame-engine packages for the final code sample of the "Building Games with Flutter" book

Big thanks to Paul Teale the author of the ["Building Games with Flutter"](https://www.amazon.com/Building-Games-Flutter-ultimate-multiplayer/dp/1801816980) book for the great content and the [code samples](https://github.com/PacktPublishing/Building-Games-with-Flutter).
I have learned a lot from this book and I highly recommend it to anyone who wants to learn how to build games with Flutter.

Since the flame-engine is rapidly evolving, the code samples needs several updates that I've implemented in this repository.
I'd like to describe them in this README file.

## Versions of packages

Increased the version of the environment sdk to ">=3.0.0 <4.0.0".

The flame-engine dependencies versions are changed to the latest ones:

```yaml
flame: ^1.8.0
flame_tiled: ^1.10.1
flame_audio: ^2.0.2
a_star_algorithm: ^0.3.0
shared_preferences: ^2.1.1
```

## Replaced mixins 

* `Tappable` to `TapCallbacks`
* `Collidable` to `CollisionCallbacks`
* `HasDraggables` to `DragCallbacks`.

Removed some not necessary mixins usage.

## Replaced classes

* `TapUpInfo` to `TapUpEvent`, `TapDownInfo` to `TapDownEvent`, add `TapCancelEvent` to `onTapCancel` method. Changed their return type from `bool` to `void`. 
* `ParticleComponent` to `ParticleSystemComponent` with `particle` named parameter.
* `HitboxRectangle` to `RectangleHitbox`, pass the `collisionType` argument with the `CollisionType.passive` value to its constructor.

## Collision detection

Replaced argument type of the other object from `Collidable` to `PositionComponent` 
and added the call of `super.onCollision(points, other);` in the `onCollision` overridden methods.

Replaced the `addHitbox()` with the `add()` method call in components.  
For instance, in case of hit-box initialization for a component with the passive collision type: 

```dart
collidableType = CollidableType.passive;
addHitbox(HitboxRectangle());
```

code is replaced to 

```dart
add(RectangleHitbox(collisionType: CollisionType.passive));
```

and in case of hitbox for a component with the active collision type: 

```dart
addHitbox(HitboxRectangle(relation: Vector2(0.7, 0.7))..relativeOffset = Vector2(0.0, 0.1));
```

code is replaced with 

```dart
add(RectangleHitbox.relative(Vector2(0.7, 0.7), parentSize: size, position: Vector2(0.0, 0.1)));
```

## World and Camera

Applied usage of the [World and Camera](https://docs.flame-engine.org/latest/flame/camera_component.html#world) components in `main.dart`.  
Added custom `World` class with `HasCollisionDetection` mixin.

Camera initialization logic:

```dart
camera.speed = 1;
camera.followComponent(george, worldBounds: Rect.fromLTWH(gameScreenBounds.left, gameScreenBounds.top, 1600, 1600));
```

is changed to the new calculation of camera bounds:

```dart
final camera = CameraComponent(world: world);
camera.follow(george);
Rectangle rect = Rectangle.fromLTRB(
    size.x / 2, size.y / 2, 1600 - size.x / 2, 1600 - size.y / 2);
camera.setBounds(rect);
camera.viewport.add(hud);
add(camera);
```

As you can see, the `Hud` component is added to the camera viewport now. Fixed the X coordinate for the Health text in the Hud class.

## TiledMap

Changed logic of reading object group from layer:

```dart
final water = tiledMap.tileMap.getObjectGroupFromLayer('Water');
final enemies = tiledMap.tileMap.getObjectGroupFromLayer('Enemies');
```

to

```dart
final water = tiledMap.tileMap.getLayer<ObjectGroup>('Water')!;
final enemies = tiledMap.tileMap.getLayer<ObjectGroup>('Enemies')!;
```

## Further improvement notes

I've noticed few issues that could fixed in the future. I didn't want to fix them now, because the main goal of this repository is to show flame-engine migration steps. 

I'm new in flutter and flame-engine, so if you find any mistakes in this repository, please let me know by PR or issue.

I hope this repository will be useful for someone else.
