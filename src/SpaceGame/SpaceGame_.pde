// Jax Jameson | 28 November 2022 | SpaceGame
import processing.sound.*;
SoundFile laser, explosion;
SpaceShip s1;
Timer rockTimer;
Timer laserTimer;
Timer powerUpTimer;
Timer eshipsTimer;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Laser> elaser = new ArrayList<Laser>();
ArrayList<EnemyShip> eships = new ArrayList<EnemyShip>();
Star[] stars = new Star[100];
int score, level, rockCount, ammo, dmg, rocksPassed, etime, rockTime;
boolean play;


void setup () {
  size(800, 800);
  laser = new SoundFile(this, "laser.wav");
  explosion = new SoundFile(this, "explode.wav");
  s1 = new SpaceShip();
  rockTime = 1000;
  rockTimer = new Timer(rockTime); // miliseconds
  rockTimer.start(rockTime);
  laserTimer = new Timer(150); // miliseconds
  laserTimer.start(150);
  powerUpTimer = new Timer(5000);
  powerUpTimer.start(5000);
  etime = 10000;
  eshipsTimer = new Timer(etime);
  eshipsTimer.start(etime);
  for (int i = 0; i< stars.length; i ++) {
    stars[i] = new Star();
  }
  score = 0;
  level = 1;
  rockCount = 0;
  play = false;
  dmg = 85;
  rocksPassed = 0;
}

void draw () {
  level =(score/10)+1;
  if(score<50){
    etime = (100-score)*100;
  }
  if (!play) {
    startScreen();
  } else {
    background(0);
    
    //rendering stars
    for (int i = 0; i< stars.length; i ++) {
      stars[i].display();
      stars[i].move();
    }
    //calling in info panel
    infoPanel();
    noCursor();

//Enemy Ships
    if (eshipsTimer.isFinished()) {
      eships.add(new EnemyShip());
      eshipsTimer.start(etime);
    }
    
    for( int i = 0; i< eships.size(); i++) {
      EnemyShip es = eships.get(i);
      if(es.reachedRightSide()) {
        eships.s = -15;
      }
    }
    
    // PowerUps
    if (powerUpTimer.isFinished()) {
      powerUps.add(new PowerUp());
      powerUpTimer.start(5000);
    }

    //rendering power ups and detecting ship collision
    for (int i = 0; i < powerUps.size(); i++) {
      PowerUp pu = powerUps.get(i);
      if (pu.intersect(s1)) {
        if (pu.type == 'H') {
          if (s1.health<900) {
          s1.health +=100;
          }
        } else if (pu.type == 'A') {
          s1.ammo += 100;
        } else {
          if (s1.turretCount<5) {
            s1.turretCount++;
          }
        }
        //todo: add sound of explosion
        //todo: add animation of explosion.
        //todo: visual effect on the ship
        powerUps.remove(pu);
        if (pu.reachedBottom()) {
          powerUps.remove(pu);
          println(powerUps.size());
        }
      }
      pu.display();
      pu.move();
    }



    // add Rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start(rockTime -(level*50));
      rockCount +=1;
    }
    //rendering rocks and detecting ship collision
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        s1.health-=r.diam;
        //todo: add sound of explosion
        //todo: add animation of explosion.
        //todo: visual effect on the ship
        rocks.remove(r);
        if (s1.health <=0) {
          fill(0);
          rect(width/2, height/2, width, height);
        }
      }
      for (int m = 0; m < lasers.size(); m++) {
        Laser l = lasers.get(m);
        if (l.intersect(r)) {
          //todo: add sound to collision
          //todo: add animation
          r.health -=dmg;
          fill (150, 150, 0);
          if (r.health>0) {
            r.diam = r.health;
            r.diam += 50;
          }
          if (r.health<=0) {
            rocks.remove(r);
            explosion.stop();
            explosion.play();
          }
          if (r.health<=0) {
            score += 1;
          }
          lasers.remove(l);
          //todo: score with removal of 1.
        }
      }
      if (r.reachedBottom()) {
        rocks.remove(r);
        rocksPassed++;
        println("Rocks:" + rocks.size());
      }
      r.display();
      r.move();
    }
    //r1.display();
    //r1.move();
    //add lasers
    //if (keyPressed && laserTimer.isFinished()) {
    //  lasers.add(new Laser(mouseX-4, mouseY));
    //  laserTimer.start();
    //}
    //if (mousePressed  && laserTimer.isFinished()) {
    //  lasers.add(new Laser(mouseX-4, mouseY));
    //  laserTimer.start();
    //}
    // rendering laser
    for (int i = 0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      if (l.reachedTop()) {
        lasers.remove(l);
        println("Lasers:" + lasers.size());
      }
      l.display();
      l.move(15);
    }
    //spaceShip health
    //if (mousePressed) {
    //  l1.x = s1.x-4;
    //  l1.y = s1.y;
    //}
    //l1.display();
    //l1.move();
    s1.display();
    s1.move(mouseX, mouseY);
    if (s1.health<1) {
      gameOver();
    }
  }
}

void mousePressed() {
  laser.stop();
  laser.play();
  if (laserTimer.isFinished()) {
    handleEvent();
  }
}

void handleEvent() {
  if (s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x-4, s1.y));
    laserTimer.start(150);
  } else if (s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser(s1.x, s1.y));
    lasers.add(new Laser(s1.x-10, s1.y));
    laserTimer.start(150);
  } else if (s1.fire() && s1.turretCount == 3) {
    lasers.add(new Laser(s1.x+2, s1.y));
    lasers.add(new Laser(s1.x-12, s1.y));
    lasers.add(new Laser(s1.x-5, s1.y));
    laserTimer.start(150);
  } else if (s1.fire() && s1.turretCount == 4) {
    lasers.add(new Laser(s1.x + 4, s1.y));
    lasers.add(new Laser(s1.x-14, s1.y));
    lasers.add(new Laser(s1.x-3, s1.y));
    lasers.add(new Laser(s1.x-9, s1.y));
    laserTimer.start(150);
  } else if (s1.fire() && s1.turretCount == 5) {
    lasers.add(new Laser(s1.x +6, s1.y));
    lasers.add(new Laser(s1.x-16, s1.y));
    lasers.add(new Laser(s1.x+1, s1.y));
    lasers.add(new Laser(s1.x-5, s1.y));
    lasers.add(new Laser(s1.x-11, s1.y));
    laserTimer.start(150);
  }
}

void keyPressed() {
  if (key == ' ' && laserTimer.isFinished()) {
    handleEvent();
    laser.stop();
    laser.play();
  }
}


void infoPanel () {
  fill(128, 127);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  textSize(15);
  textAlign(CENTER);
  text("Space Game" + " | level:" + level + " | score:" + score + " | Ammo:" + s1.ammo  + " | Health" + s1.health + " | Rocks passed" + rocksPassed, 200, 40);
}

void startScreen () {
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(30);
  text("Click or press any key to start...", width/2, height/2);
  if (mousePressed || keyPressed) {
    play = true;
  }
}


void gameOver () {
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(30);
  text("Game Over!", width/2, height/2);
  play = false;
  noLoop();
}
