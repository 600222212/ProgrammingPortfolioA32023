class Rock {
  int x, y, diam, speed, health;
  PImage rock;
  Rock () {
    x = int(random(width));
    y = -50;
    diam = int(random(75, 150));
    health = diam-20;
    speed = int(random(2, 10));
    rock = loadImage("rock.png");
  }

  void display () {
    rock.resize(diam, diam);
    imageMode(CENTER);
    image(rock, x, y);
    if(health>0){
    //rect(x, y-(diam/2), health/2, 10);
    }
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y >height+100) {
      return true;
    } else {
      return false;
    }
  }
}
