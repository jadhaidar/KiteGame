class Kite {
  int x, y, w, h;
  int speed, prevSpeed;
  color c;

  Kite(int x, int y, int w, int h, color c, int speed) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    this.speed = speed;
  }

  void Display(boolean isMovingNorth) {
    fill(c);
    quad(x-w, y, x, y-h, x+w, y, x, y+h);
    line(x-w, y, x+w, y);    // horizontal
    line(x, y-h, x, y+h*2);  // vertical
    triangle(x-15, y+h+10, x-15, y+h+20, x, y+h+15);
    triangle(x+15, y+h+10, x+15, y+h+20, x, y+h+15);
    triangle(x-15, y+h+30, x-15, y+h+40, x, y+h+35);
    triangle(x+15, y+h+30, x+15, y+h+40, x, y+h+35);

    if (isMovingNorth) {
      y -= speed;
      if (y+h*2 <= 0) y = height-70+h;
    } else {
      y += speed;
      if (y-h >= height-70) y = -h*2;
    }
  }

  boolean isMouseOver() {
    if (mouseX >= x-w && mouseX <= x+w && mouseY >= y-h && mouseY <= y+h) {
      return true;
    } else return false;
  }
}