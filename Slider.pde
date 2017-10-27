class Slider {
  Track track;
  int x, y, w, h;

  // default constructor
  Slider () {
    x = 0;
    y = height - 70;
    w = width;
    h = 70;
    track = new Track(x+40, y+30, w-80, h-60);
  }

  void Display() {
    fill(255);
    rect(x, y, w, h);
    track.Display();
  }

  void IsMouseOver() {
    track.knob.IsMouseOver();
  }

  void Drag() {
    track.knob.Drag();
  }

  void Lock() {
    track.knob.isLocked = true;
  }

  color GetBackground() {
    return color(0, 0, track.knob.blue);
  }
}