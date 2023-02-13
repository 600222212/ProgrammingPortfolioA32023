class SpaceShip {
  int x, y, w, ammo, turretCount, health, time, my, mx;
  PImage ship;


  SpaceShip() {
    x = 0;
    y = 0;
    w = 90;
    ammo = 1000;
    turretCount = 1;
    health = 1000;
    time = 0;
    ship = loadImage("ship.png");
  }

  void display () {
    imageMode(CENTER);
    ship.resize(120, 120);
    noCursor();
    image(ship, x, y);
  }

  void move(int tempx, int tempy) {
    //if (keyPressed) {
    //if(keyCode == 37) {
    //  x -= 20;
    //} else if (keyCode == 39) {
    //  x+=20;
    //}else if (keyCode == 38) {
    //  y -=20;
    //} else if (keyCode == 40) {
    //  y += 20;
    //}
    //}else {
    if (tempx-mx == 0 && tempy-my ==0) {

      if (keyPressed) {
        if (keyCode == 37 || x>0) {
          x -= 10;
        } else if (keyCode == 39) {
          x+=10;
        } else if (keyCode == 38) {
          y -=10;
        } else if (keyCode == 40) {
          y += 10;
        } else if (keyCode == 39 && keyCode == 38) {
          x +=10;
          y -= 10;
        } else if (keyCode == 39 && keyCode == 40) {
          x +=10;
          y +=10;
        } else if (keyCode == 37 && keyCode == 38) {
          x -=10;
          y -=10;
        } else if (keyCode == 37 && keyCode == 40) {
          x -=10;
          y +=10;
        }
      }
    } else {
      x = tempx;
      y = tempy;
      //}
    }
     mx = tempx;
    my = tempy;
  }
 

  boolean fire() {
    if (ammo>0) {
      ammo--;
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d< rock.diam/2 + w/2 -40) {
      return true;
    } else {
      return false;
    }
  }
}
