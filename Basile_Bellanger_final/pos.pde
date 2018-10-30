class Ballon {
  float x;
  float y;
  float k;
  Ballon(float x, float y) {
    this.x=x;
    this.y=y;
    this.k=k;
  }
  float pos(float a, float c, float v) { 
    return (c-a)*v+a;
  }
  void display() {
  /*    fill(230, 150,100);
    ellipse(x, y, 50, 50);*/
    PImage img;
  img=loadImage("Logo_recyclage.png");
  image(img,x-25,y-25,50,50);
  /*  fill(230, 150,100);
    ellipse(x, y, 50, 50);*/
  }
  void update(float w, float z,float k) {
    x=pos(x, w, k);
    y=pos(y, z, k);
  }
  void updateM(float w, float z) {
    y=pos(x, w, k);
    x=pos(y, z, k);
  }
}
