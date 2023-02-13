class Button {
  // Member Variables
  int x, y, w, h;
  char val, c;
  color c1, c2, c3, c4, c5, c6;
  boolean on;

  // constructor
  Button(int x, int y, int w, int h, char val, char c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    this.val = val;
    c5 = color(100, 0, 0);
    c1 = color(127);
    c2 = color(0, 0, 155);
    c3 = color(0, 100, 0);
    c4 = color(255, 0, 255);
    c6 = color(0,120, 120);
    on = false;
  }

  void display() {
    if (c == 'y') {
      fill(c2);
    } else if (c == 'b'){
      fill(c1);
    } else {
      fill(c5);
    }
    if(on && c== 'y') {
      fill(c3);
    } 
    if (on && c== 'b'){
      fill(c4);
    }
    if (on && c == 'm') {
      fill(c6);
    }
    rectMode(CENTER);
    rect(x, y, w, h);
    fill(255);
    textSize(20);
    textAlign(CENTER);
    if (val == 'C') {
      text("clear", x, y);
    } else if (val == 's') {
      text("x²", x, y); 
    } else {
      text(val,x, y);
    }
  }

  void hover(int mx, int my) {
    on = (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2);
  }
}
