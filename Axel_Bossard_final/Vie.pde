PImage heart;

class Vie {

  float xoff = 0.0;
  float yoff = 0.0;
  float xpos;
  float ypos;

  Vie () {

    xoff = random(5);
    yoff = random(5);
    xpos = random(width);
    ypos = random(height);
  }

  //==================================================================================================

  void display() {


    heart = loadImage("heart3.png");
    image(heart, xpos, ypos, 25, 25);
  }
  //==================================================================================================

  void update (float d) {

    xoff = xoff + 0.02;
    xpos = xpos + (noise(xoff)-0.5) * d;
    yoff = yoff + 0.02;
    ypos = ypos + (noise(yoff)-0.5) * d;

    //WRAP.........................................................
    if (xpos>width+25) {
      xpos = 0;
    }
    if (xpos<(-25)) {
      xpos = width;
    }
    if (ypos>height+25) {
      ypos = 0;
    }
    if (ypos<(-25)) {
      ypos = height;
    }
  }
}
