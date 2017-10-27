class KiteFactory {
  ArrayList kites;
  boolean isMovingNorth, isStopped;

  KiteFactory() {
    kites = new ArrayList();
    isMovingNorth = true;
    isStopped = false;
  }

  void AddKiteAtMouse() {
    kites.add(new Kite(mouseX, mouseY, floor(random(40, 60)), floor(random(40, 60)), RandomColor(), RandomSpeed()));
  }

  void AddRandomKite() {
    kites.add(new Kite(floor(random(60, width-60)), floor(random(60, height-60)), floor(random(40, 60)), floor(random(40, 60)), RandomColor(), RandomSpeed()));
  }

  void RemoveRandomKite() {
    if (kites.size() > 0)
      kites.remove(floor(random(0, kites.size())));
  }

  void IncreaseSpeed() {
    for (int i=0; i<kites.size(); i++) {
      Kite kite = (Kite) kites.get(i);
      //if (kite.speed < 6) 
      kite.speed++;
    }
  }

  void DecreaseSpeed() {
    for (int i=0; i<kites.size(); i++) {
      Kite kite = (Kite) kites.get(i);
      if (kite.speed > 1) kite.speed--;
    }
  }

  void Start() {
    if (isStopped) {
      isStopped = false;
      for (int i=0; i<kites.size(); i++) {
        Kite kite = (Kite) kites.get(i);
        if (kite.prevSpeed == 0) 
          kite.prevSpeed = floor(random(1, 7));
        kite.speed = kite.prevSpeed;
      }
    }
  }

  void Stop() {
    isStopped = true;
    for (int i=0; i<kites.size(); i++) {
      Kite kite = (Kite) kites.get(i);
      kite.prevSpeed = kite.speed;
      kite.speed = 0;
    }
  }

  boolean isPointWithinKite() {
    boolean b = false;
    for (int i=0; i<kites.size(); i++) {
      Kite kite = (Kite) kites.get(i);
      if (kite.isMouseOver()) {
        kites.remove(kite);
        b = true;
        break;
      }
    }
    println(b);
    return b;
  }

  void Display() {
    for (int i=0; i<kites.size(); i++) {
      Kite kite = (Kite) kites.get(i);
      kite.Display(isMovingNorth);
    }
  }

  // ---------------------------------//
  // -------- helper methods ---------//

  private int RandomSpeed() {
    if (isStopped) return 0; 
    else return floor(random(1, 7));
  }

  private color RandomColor() {
    return color(floor(random(0, 256)), floor(random(0, 256)), floor(random(0, 256)));
  }
}