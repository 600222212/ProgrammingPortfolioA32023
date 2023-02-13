class Laser {
  int x, y, w,h;
  Laser ( int x, int y) {
    this.x = x;
    this.y = y;
    w = 4;
    h = 15;
  }
  
  void display () {
    rectMode(CENTER);
    fill ( 200, 22, 22);
    noStroke();
    rect(x,y,w,h);
  }
  
  void move(int speed) {
    y -= speed;
  }
  
  boolean reachedTop() {
    if (y <-100) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean intersect(Rock rock) {
    float l = dist(x, y, rock.x, rock.y);
    if (l <rock.diam/2) {
    return true;
    } else {
      return false;
    }
  }
  
}
