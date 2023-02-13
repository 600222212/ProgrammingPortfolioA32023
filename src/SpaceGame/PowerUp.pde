class PowerUp {
  int x, y, diam, speed;
  char type;
  color c;
  //PImage powerUp;
  PowerUp () {
    x = int(random(width));
    y = -50;
    diam = 50;
    speed = int(random(2, 10));
    //powerUp = loadImage("rock.png");
    int rand = int(random(3));
    if (rand == 0) {
      type = 'A';
    } else if (rand == 1) {
      type = 'H';
    } else if (rand == 2 && s1.turretCount<5){
      type = 'T';
    }
  //  if(int(random(2)) == 0) {
  //    val = 'h';
  //  } else {
  //    val = 'a';
  //  }
  }

  void display () {
    fill(20, 180, 20);
    ellipse(x, y, diam, diam);
    fill(0);
    text(type,x,y);
    //rock.resize(diam, diam);
    //imageMode(CENTER);
    //image(rock, x, y);
    //if(health>0){
    ////rect(x, y-(diam/2), health/2, 10);
    //}
  }

  void move() {
    y += speed;
  }
  
  boolean intersect(SpaceShip ship) {
    float l = dist(x, y, ship.x, ship.y);
    if (l <ship.w/2) {
    return true;
    } else {
      return false;
    }
  }

  boolean reachedBottom() {
    if (y >height+100) {
      return true;
    } else {
      return false;
    }
  }
}
