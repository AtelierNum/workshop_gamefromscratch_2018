class megaBonus{
  float x;
  float y;
  float k;
  megaBonus(float x, float y, float k) {
    this.x=x;
    this.y=y;
    this.k=k;
  }
  float pos(float a, float c, float v) { 
    return (c-a)*v+a;
  }
  void display() {
    
  //  PImage img;
  //  img=loadImage("vortex.png");
    strokeWeight(15);
    stroke(200,200,100);
    noFill();
   // image(img,x-125,y-125,85,85);
   if((dist(mouseX,mouseY,x,y)<40)){
      fill(#03FCC0,30);
    }
   ellipse(x,y,85,85);
    noStroke();
    
  }
  float xoff = random(500);
  float yoff = random(500);
  void update() {
    if (mousePressed==true){
      x=mouseX;
      y=mouseY;
    } else {
    x  = x+(noise(xoff)-0.5)*5;
    xoff=xoff+k;
    y = y+(noise(yoff)-0.5)*5;
    yoff=yoff+k;
    }
  }
}
