// Jax Jameson || 10 Oct 2022 | Screensaverr App
float xpos;
float ypos;
float stroke;
float strokeW;
float pointCount;

void setup() {
  size(displayWidth, displayHeight);
  xpos = random(width);
  ypos = random(height);
  background(random(180, 255));
}

void draw() {
  strokeW = random (0.01, 5);
  pointCount = random(5, 20);
  stroke(random(25), random(255), random (255));
  strokeWeight(strokeW);
  if (xpos>width || xpos <0 || ypos > height || ypos < 0) {
    xpos = random(width);
    ypos = random(height);
  } else {
    if (random (100)>70) {
      strokeWeight(strokeW);
      moveLeft(xpos, ypos, pointCount);
    } else if (random(100)>71) {
      strokeWeight(strokeW);
      moveUp(xpos, ypos, pointCount);
    } else if (random(100)>60) {
      strokeWeight(strokeW);
      moveDown(xpos, ypos, pointCount);
    } else {
      strokeWeight(strokeW);
      moveRight(xpos, ypos, pointCount);
    }
  }
}


void moveRight (float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX+i, startY);
    xpos = startX + i;
  }
}

void moveLeft (float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX-i, startY);
    xpos = startX - i;
  }
}

void moveUp (float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY-i);
    ypos = startY - i;
  }
}

void moveDown (float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY+i);
    ypos = startY + i;
  }
}
