class Balle {
  float x;
  float y;
  float k;
  Balle(float x, float y, float k) {
    this.x=x;
    this.y=y;
    this.k=k;
  }
  float pos(float a, float c, float v) { 
    return (c-a)*v+a;
  }
  void display() {
    fill(250, 250, 250);
    PImage img;
    img=loadImage("boulette.png");
    image(img,x-25,y-25);
   // ellipse(x, y, 50, 50);
  }
  float xoff = random(500);
  float yoff = random(500);
  void update() {
    x  = x+(noise(xoff)-0.5)*8;
    xoff=xoff+k;
    y = y+(noise(yoff)-0.5)*9;
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
