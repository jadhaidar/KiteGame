class ScoreController {
  int score;

  ScoreController() {
    score = 0;
  }

  void Display() {
    fill(255);
    textSize(26);
    text("Score = " + score, 25, 50);
  }

  void Update() {
    score++;
  }

  void Reset() {
    score = 0;
  }
}