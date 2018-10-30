class Sniper {
  float xpos;
  float ypos;
  float noiseX ;
  float noiseY;

  Sniper(float x, float y) {// Constructeur
    xpos = x;
    ypos = y;
    noiseX = random(100);
    noiseY = random(100);
  }

  void update(float currentlevel) {
    noiseX += 0.05;
    noiseY += 0.05;
    xpos += (noise(noiseX) -0.5)*(currentlevel*random(10));
    ypos += (noise(noiseY) -0.5)*(currentlevel*random(10));

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
    fill(255, 50, 5);
    ellipse(xpos, ypos, random(41, 51), random(41, 51) );

    fill(random(100, 255), 50, 0, random(100, 255));
    ellipse(xpos, ypos, random(40), random(100) );

    fill(random(100, 255), 50, 0, random(100, 255));
    ellipse(xpos, ypos, random(100), random(40) );

    fill(0, 0, 0);
    ellipse(xpos, ypos, 40, 40 );


    fill(255, 10, 100);
    ellipse(random(xpos-10, xpos+10), random(ypos-10, ypos+10), 6, 6 );
    ellipse(random(xpos-10, xpos+10), random(ypos-10, ypos+10), 6, 6 );
    ellipse(random(xpos-15, xpos+15), random(ypos-10, ypos+10), 6, 6);
  }
}
