class Agentdouble {

  float xoff=0.0;
  float yoff=0.0;
  float xpos;
  float ypos;
  float speedx;
  float speedy;


  Agentdouble (float numrandomx, float numrandomy, float speedx, float speedy) {
    xoff=random(numrandomx);
    yoff=random(numrandomy);
    xpos=random(width);
    ypos=random(height);
    this.speedx=speedx;
    this.speedy=speedy;
  }

  void display() {
    fill(255, 0, 0);
    stroke(0);
    image(burns,xpos, ypos, 50, 50);

    if (xpos-30>width) {
      xpos=xpos-(width+30);
    }

    if (xpos+30<0) {
      xpos=xpos+(width+30);
    }

    if (ypos-30>height) {
      ypos=ypos-(height+30);
    }

    if (ypos+30<0) {
      ypos=ypos+(height+30);
    }
  }

  void update(float speedx, float speedy) {
    xoff=xoff+0.001;
    xpos=xpos+((noise(xoff)-0.5)*speedx);
    yoff=yoff+0.001;
    ypos=ypos+((noise(yoff)-0.5)*speedy);
  }
}
