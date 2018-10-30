class Agent { // class bulles clean
  float xoff = 0.0;
  float yoff = 0.0;
  float xpos ;
  float ypos;

  Agent(float x, float y) {
    xoff = random (5) ;
    yoff = random (5) ;
    xpos = x;
    ypos = y;
  }
  //dessin
  void display () {
    stroke (255);
    fill (255);
    
    image(eau, xpos, ypos, 120, 120);


    //faire respawn à l'opposé
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
  void update () { //fonction noise
    xoff = xoff + 0.01;
    xpos = xpos + (noise(xoff)-0.5) * 4;

    yoff = yoff + 0.01;
    ypos = ypos + (noise(yoff)-0.5) * 4;
  }
}
