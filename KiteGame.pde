Slider slider;
KiteFactory kites;
ScoreController score;

void setup() {
  size(1620, 780);
  slider = new Slider();
  kites = new KiteFactory();
  score = new ScoreController();
}

void draw() {
  background(slider.GetBackground());
  kites.Display();
  slider.Display();
  score.Display();
}

// ---------------------------------//
// -------- event handlers ---------//

void mousePressed() {
  if (mouseButton == LEFT) {
    slider.IsMouseOver();
    if (kites.isPointWithinKite())
      score.Update();
  }
  if (mouseButton == RIGHT) {
    kites.AddKiteAtMouse();
  }
}

void mouseDragged() {
  slider.Drag();
}

void mouseReleased() {
  slider.Lock();
}

void keyPressed() {
  if (key == 'a') {
    kites.AddRandomKite();
  }
  if (key == BACKSPACE) {
    kites.RemoveRandomKite();
  }
  if (key == '+' || key == '=') {
    kites.IncreaseSpeed();
  }
  if (key == '-') {
    kites.DecreaseSpeed();
  }
  if (key == 's') {
    kites.Stop();
  }
  if (key == 'g') {
    kites.Start();
  }
  if (keyCode == DOWN) {
    kites.isMovingNorth = false;
  }
  if (keyCode == UP) {
    kites.isMovingNorth = true;
  }
}