class ViePlus {

  float xoff=0.0;
  float yoff=0.0;
  float xpos;
  float ypos;


  ViePlus (float numrandomx, float numrandomy) {
    xoff=random(numrandomx);
    yoff=random(numrandomy);
    xpos=random(width);
    ypos=random(height);
  }

  void display() {
    fill(255,255, 0);
    stroke(0);
    image(duff,xpos,ypos,40,40);

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

  void update() {
    xoff=xoff+0.001;
    xpos=xpos+((noise(xoff)-0.5)*5);
    yoff=yoff+0.001;
    ypos=ypos+((noise(yoff)-0.5)*8);
  }
}
