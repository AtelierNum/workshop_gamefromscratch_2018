class Agent {

  float xoff=0.0;
  float yoff=0.0;
  float xpos;
  float ypos;


  Agent (float numrandomx, float numrandomy) {
    xoff=random(numrandomx);
    yoff=random(numrandomy);
    xpos=random(width);
    ypos=random(height);
  }

  void display() {
    fill(255, 255, 255);
    stroke(0);
    image(donut, xpos, ypos, 60, 50);

    if (xpos-20>width) {
      xpos=xpos-(width+20);
    }

    if (xpos+20<0) {
      xpos=xpos+(width+20);
    }

    if (ypos-20>height) {
      ypos=ypos-(height+20);
    }

    if (ypos+20<0) {
      ypos=ypos+(height+20);
    }
  }

  void update() {
    xoff=xoff+0.01;
    xpos=xpos+(noise(xoff)-0.5)*4;
    yoff=yoff+0.01;
    ypos=ypos+(noise(yoff)-0.5)*4;
  }
}
