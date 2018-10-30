class Ennemi {
  float x;
  float y;
  float k;
  Ennemi(float x, float y, float k) {
    this.x=x;
    this.y=y;
    this.k=k;
  }
  float pos(float a, float c, float v) { 
    return (c-a)*v+a;
  }
  void display() {
    fill(255, 0, 0);
    PImage img;
    img=loadImage("capsule2.png");
    image(img,x-25,y-25);
   // ellipse(x, y,50,50);
  }
  float xoff = random(500);
  float yoff = random(500);
  void update(float d) {
    x  = x+(noise(xoff)-0.5)*d;
    xoff=xoff+k;
    y = y+(noise(yoff)-0.5)*d;
    yoff=yoff+k;
    if (x>width+25) {
      x=0;
    }
    if (x<-25) {
      x=width;
    }
    if (y>height+25) {
      y=0;
    }
    if (y<-25) {
      y=height;
    }
  }
}
