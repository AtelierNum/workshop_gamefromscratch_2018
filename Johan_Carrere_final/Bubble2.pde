class Bubbles2 {
  float xpos;
  float ypos;
  float noiseX ;
  float noiseY;

  Bubbles2(float x, float y) {// Constructeur
    xpos = x;
    ypos = y;
    noiseX = random(100);
    noiseY = random(100);
  }

  void update(float currentlevel) {
    noiseX += 0.05;
    noiseY += 0.05;
    xpos += (noise(noiseX) -0.5)*10*(currentlevel);
    ypos += (noise(noiseY) -0.5)*10*(currentlevel);

    //
    if (xpos-70>width) {
      xpos = xpos - (width-70);
    }
    //
    if (xpos+70<0) {
      xpos = xpos + (width+70);
    }
    //
    if (ypos-70>height) {
      ypos = ypos - (height-70);
    }
    //
    if (ypos+70<0) {
      ypos = ypos + (height+70);
    }
    //
  }

  void display() {
        noStroke();
          
    fill(150, 0, 0,random(100));
    ellipse(xpos, ypos, 35, 35);
    fill(random(150,255), 0, 0,random(100,255));
    ellipse(xpos, ypos, random(35,50), random(35,50));
    fill(0,0,0);
    ellipse(xpos, ypos, 30, 30);
  }
}
