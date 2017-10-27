class Track {
  Knob knob;
  int x, y, w, h;

  Track(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    knob = new Knob(x, y+(h/2), h*3);
    knob.SetConstrains(x, w);
  }

  void Display() {
    fill(200);
    rect(x, y, w, h);
    knob.Display();
  }
}