 class Viesup { // class bulles 1up
  float xoff = 0.0;
  float yoff = 0.0;
  float xpos ;
  float ypos;

  Viesup(float x, float y) {
    xoff = random (5) ;
    yoff = random (5) ;
    xpos = x;
    ypos = y;
  }

  void display () {
    stroke (0, 255, 0);
    fill (0, 255, 0);
    ellipse (xpos, ypos, 30, 30) ;


    if (xpos-30>width) {
      xpos = xpos- (width +30);
    }
    if (xpos+30<0) {
      xpos = xpos+(width +30) ;
    }
    if (ypos-30>height) {
      ypos = ypos-(height +30) ;
    }
    if (ypos+30<0) {
      ypos = ypos+(height+30);
    }
  }
  void update () { 
    xoff = xoff + 0.01;
    xpos = xpos + (noise(xoff)-0.5) * 4;

    yoff = yoff + 0.01;
    ypos = ypos + (noise(yoff)-0.5) * 4;
  }
}
