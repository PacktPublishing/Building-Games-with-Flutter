import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';

class ScoreText extends HudMarginComponent {

  ScoreText({Vector2? position}) : super (position: position);

  int score = 0;
  String scoreText = "Score: ";

  late TextPaintConfig _regularTextConfig;
  late TextPaint _regular;
  late TextComponent scoreTextComponent;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    _regularTextConfig = TextPaintConfig(color: BasicPalette.blue.color);
    _regular = TextPaint(config: _regularTextConfig);
    
    scoreTextComponent = TextComponent(scoreText + score.toString(), textRenderer: _regular)..isHud = true;

    add(scoreTextComponent);
  }

  setScore(int score) {
    this.score += score;
    scoreTextComponent.text = scoreText + this.score.toString();
  }
}