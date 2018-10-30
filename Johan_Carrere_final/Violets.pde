class Violet {
  float xpos;
  float ypos;
  float noiseX ;
  float noiseY;

  Violet(float x, float y) {// Constructeur
    xpos = x;
    ypos = y;
    noiseX = random(100);
    noiseY = random(100);
  }

  void update(float level) {
    noiseX += 0.05;
    noiseY += 0.05;
    xpos += (noise(noiseX) -0.5)*1;
    ypos += (noise(noiseY) -0.5)*6;

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
    
       fill(random(50,100), random(255), random(255), random(100,255));
    ellipse(xpos, ypos, random(25),random(25) );
    ellipse(xpos, ypos, random(60),random(25) );
    ellipse(xpos, ypos, random(25),random(60) );
    fill(255,255,255);
    ellipse(xpos, ypos, 10,10 );
    
  
  }
}
