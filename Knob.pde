class Knob {
  float blue;
  int x, y, size;
  int xOffset, xMin, xMax;
  boolean isLocked;

  Knob(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    isLocked = true;
  }

  void Display() {
    ellipse(x, y, size, size);
  }

  void SetConstrains(int min, int max) {
    xMin = min;
    xMax = max+size;
  }

  void IsMouseOver() {
    // formula retreived from https://processing.org/examples/rollover.html
    if (sqrt(sq(x - mouseX) + sq(y - mouseY)) < size/2 ) {  
      isLocked = false;
      xOffset = mouseX - x;
    }
  }

  void Drag() {
    if (!isLocked) {
      x = constrain(mouseX - xOffset, xMin, xMax);
      blue = map(x, xMin, xMax, 0, 255);
    }
  }
}