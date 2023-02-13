//Jax Jameson | Nov 2022 | Calculator //<>// //<>//
Button [] numsButtons = new Button [10];
Button [] opButtons = new Button[12];
String dVal = "0.0";
boolean left = true;
float l, r, result;
char op = ' ';
int s = 40;

void setup() {
  size(400, 660);
  numsButtons[0] = new Button(160, 630, 160, 60, '0', 'y');
  numsButtons[1] = new Button(120, 560, 80, 80, '1', 'y');
  numsButtons[2] = new Button(200, 560, 80, 80, '2', 'y');
  numsButtons[3] = new Button(280, 560, 80, 80, '3', 'y');
  numsButtons[4] = new Button(120, 480, 80, 80, '4', 'y');
  numsButtons[5] = new Button(200, 480, 80, 80, '5', 'y');
  numsButtons[6] = new Button(280, 480, 80, 80, '6', 'y');
  numsButtons[7] = new Button(120, 400, 80, 80, '7', 'y');
  numsButtons[8] = new Button(200, 400, 80, 80, '8', 'y');
  numsButtons[9] = new Button(280, 400, 80, 80, '9', 'y');
  opButtons[0] = new Button(360, 590, 80, 140, '=', 'm');
  opButtons[1] = new Button(280, 630, 80, 60, '.', 'b');
  opButtons[2] = new Button(360, 480, 80, 80, '+', 'b');
  opButtons[3] = new Button(360, 400, 80, 80, '-', 'b');
  opButtons[4] = new Button(360, 320, 80, 80, 'x', 'b');
  opButtons[5] = new Button(360, 240, 80, 80, '÷', 'b');
  opButtons[6] = new Button(40, 590, 80, 140, '√', 'b');
  opButtons[7] = new Button(40, 440, 80, 160, 's', 'b');
  opButtons[8] = new Button(80, 320, 160, 80, '%', 'b');
  opButtons[9] = new Button(80, 240, 160, 80, 'π', 'b');
  //opButtons[10] = new Button(120, 240, 80, 80, '?', 'b');
  //opButtons[11] = new Button(120, 320, 80, 80, '?', 'b');
  opButtons[10] = new Button(240, 240, 160, 80, 'C', 'm');
  opButtons[11] = new Button(240, 320, 160, 80, '±', 'b');
}

void draw() {
  background(0, 0, 70);
  for (int i = 0; i<numsButtons.length; i ++) {
    numsButtons[i].display();
    numsButtons[i].hover(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i ++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }

  updateDisplay();
}

void keyPressed() {
  println("key:" + key);
  println("keyCode:" + keyCode);
  if (keyCode == 49 | keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 46 | keyCode == 110) {
    handleEvent(".", false);
  } else if (keyCode == 50 | keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 51 | keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 52 | keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 | keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 | keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 | keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 | keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 | keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 48 | keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 10) {
    handleEvent("=", false);
  } else if ((keyCode == 61) | keyCode == 107) {
    handleEvent("+", false);
   // not done yet
  } else if ((keyCode == 45) | keyCode == 109) {
    handleEvent("-", false);
  } else if  (keyCode == 106) {
    handleEvent("*", false);
  } else if  (keyCode == 47 | keyCode == 111) {
    handleEvent("÷", false);
  } else if (keyCode == 67) {
    handleEvent("C", false);
  }
  
  // if (keyPressed == 16){
  //  if (keyCode == 56) {
    // handleEvent("*", false);
  //} else if (keyCode == 53) {
  //  handleEvent("%", false);
  //} else if ( keyCode == 61) {
  //  handleEvent("+", false);
  //}
  //}
}

void handleEvent(String val, boolean nums) {
  if (nums && dVal.length() < 30) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) {
    dVal = "0.0";
    left = true;
    l = 0.0;
    r = 0.0;
    result = 0.0;
    op =  ' ';
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  } else if (val.equals("+")) {
    op = '+';
    dVal = "0.0";
    left = false;
  } else if (val.equals("-")) {
    op = '-';
    dVal = "0.0";
    left = false;
  } else if (val.equals("*")) {
    op = 'x';
    dVal = "0.0";
    left = false;
  }  else if (val.equals("÷")) {
    op = '÷';
    dVal = "0.0";
    left = false;
  }  else if (val.equals("=")) {
    performCalculation();
  }  else if (val.equals("%")) {
    op = '%';
    performCalculation();
  }
}

void mouseReleased() {
  for (int i = 0; i<numsButtons.length; i ++) {
    if (numsButtons[i].on) {
      handleEvent(str(numsButtons[i].val), true);
    }
  }
  for (int i = 0; i<opButtons.length; i ++) {
    if (opButtons[i].on && opButtons[i].val =='C') {
      handleEvent(str(opButtons[i].val), false);
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      handleEvent("+", false);
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      handleEvent("-", false);
    } else if (opButtons[i].on && opButtons[i].val == 'x') {
      handleEvent("*", false);
    } else if (opButtons[i].on && opButtons[i].val == '÷') {
      handleEvent("÷", false);
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '%') {
      op = '%';
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      dVal = "0";
      if (left) {
        if ( l >0) {
          l = l*(-1);
          dVal = str(l);
        }
      } else {
        r = r*(-1);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == 's') {
      if (left) {
        l = l*l;
        dVal = str(l);
      } else {
        r = r*r;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      handleEvent(".", false);
    } else if (opButtons[i].on && opButtons[i].val == 'π') {
      op = 'π';
      dVal = "0";
      left = false;
      performCalculation();
    }
    println("l:" + l + " r:" + r + " op:" + op + " result:" + result + " Left:" + left);
  }
}

void updateDisplay () {
  fill (220);
  rect(width/2, 100, 380, 180, 20);
  fill(255);
  textAlign(RIGHT);
  if (dVal.length() < 18) {
    textSize(s);
  } else if (dVal.length () > 17) {
    textSize(63 - (float(dVal.length())* 1.4));
  }
  text(dVal, width- 30, 160);
}

void performCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == 'x') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  } else if (op == '√') {
    result = sqrt(l);
  } else if (op == '%') {
    result = l/100;
  } else if (op == 'π') {
    if (l>0) {
      result = l * PI;
    } else if (l == 0) {
      result = PI;
    } else if (r == 0) {
      r = PI;
    }else if (left == false) {
      r = r*PI;
  }else {
      result = PI;
    }
  }
  dVal = str(result);
  l = result;
  left = true;
}
