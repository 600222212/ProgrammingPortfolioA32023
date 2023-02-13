class EnemyShip {
  int x, y, w, turretCount, health, time, s;
  PImage eship;


  EnemyShip() {
    x = 0;
    y = 100;
    w = 90;
    turretCount = 1;
    s = 15;
    health = int(random(50,260));
    time = 0;
    eship = loadImage("eship.png");
  }

  void display () {
    imageMode(CENTER);
    eship.resize(120, 120);
    noCursor();
    image(eship, x, y);
  }

  void move() {
     x += s;
  }
  
 

  boolean fire() {
return true;
  }
  
  boolean reachedSide(){
    float d = dist(x, y, 0);
    float m = dist(x, y, width);
    if (d< w || m< w) {
      s *= -1;
      return true;
    } else {
      return false;
    }
  }
  }

  boolean intersect(SpaceShip ship) {
    float d = dist(x, y, ship.x, ship.y);
    if (d< ship.w/2 + w/2 -40) {
      return true;
    } else {
      return false;
    }
  }
}
