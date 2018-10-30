class Agent {
  float xoff = 0.0;
  float yoff = 0.0;
  float xpos;
  float ypos;
  PImage Bb;

  Agent(float x, float y) { 
    xoff = random(5);
    yoff = random(5);
    xpos = x;
    ypos = y;
  }

  void display(PImage Bb) {
    fill(255);
    image(Bb, xpos, ypos);//application de l'image
  }

  void update() {
    xoff = xoff + 0.01;//application du noise
    xpos = xpos + (noise(xoff)-0.5) * 4;

    yoff = yoff + 0.01;
    ypos = ypos + (noise(yoff)-0.5) * 4;

    if (xpos<= 0) {//conditions pour faire apparaître les bulles de partout et qu'elles soient continues sans le hors champs
      xpos = (width);
    }
    if (ypos<= 0) {
      ypos = (height);
    }
    if (xpos >= (width)) {
      xpos = 0;
    }
    if (ypos >= (height)) {
      ypos = 0;
    }
  }
}

class Agent2 {
  float xoff = 0.0;
  float yoff = 0.0;
  float xpos;
  float ypos;

  Agent2(float x, float y) { 
    xoff = random(5);
    yoff = random(5);
    xpos = x;
    ypos = y;
  }


  void display(PImage balleRouge) {
    //fill(#FF0000);
    image( balleRouge, xpos, ypos);
  }

  void setup() {
    //balleRouge = loadImage("boule rouge");
  }

  void update() {
    xoff = xoff + 0.01;//application du noise
    xpos = xpos + (noise(xoff)-0.5) * 4;

    yoff = yoff + 0.01;
    ypos = ypos + (noise(yoff)-0.5) * 4;

    if (xpos<= 0) {//conditions/wrap pour faire apparaître les bulles ROUGES de partout et qu'elles soient continues sans le hors champs
      xpos = (width);
    }
    if (ypos<= 0) {
      ypos = (height);
    }
    if (xpos >= (width)) {
      xpos = 0;
    }
    if (ypos >= (height)) {
      ypos = 0;
    }
  }
}
class Ball {

  float xpos;
  float ypos;

  Ball(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
  }

  void display() {
    fill(255);
    ellipse(xpos, ypos, 100, 100);
  }

  float attract (float target, float position, float sensitivity) {
    //position = (target - position)* sensitivity + position;
    return (target-position)*sensitivity+position;
  }

  void update(float xtarget, float ytarget, float sensitivity) {
    xpos = attract (xtarget, xpos, sensitivity);
    ypos = attract (ytarget, ypos, sensitivity);
  }
}


class Bonus {
  float xoff = 0.0;
  float yoff = 0.0;
  float xpos;
  float ypos;
  PImage bonusVert;

  Bonus(float x, float y) { 
    xoff = random(5);
    yoff = random(5);
    xpos = x;
    ypos = y;
  }

  void display(PImage bonusVert) {
    fill(255);
   image(bonusVert, xpos, ypos);
  }

  void update() {
    xoff = xoff + 0.01;//application du noise
    xpos = xpos + (noise(xoff)-0.5) * 4;

    yoff = yoff + 0.01;
    ypos = ypos + (noise(yoff)-0.5) * 4;

    if (xpos<= 0) {//conditions pour faire apparaître les bulles de partout et qu'elles soient continues sans le hors champs
      xpos = (width);
    }
    if (ypos<= 0) {
      ypos = (height);
    }
    if (xpos >= (width)) {
      xpos = 0;
    }
    if (ypos >= (height)) {
      ypos = 0;
    }
  }
}
