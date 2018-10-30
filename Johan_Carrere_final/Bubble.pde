class Bubbles { //Initialisation des variables xpos ypos noiseX et noiseY
  float xpos;
  float ypos;
  float noiseX ;
  float noiseY;


  Bubbles(float x, float y) {// Constructeur de la classe Bubble
    xpos = x;
    ypos = y;
    noiseX = random(100); //assigne random(100) a noiseX
    noiseY = random(100); //assigne random(100) a noiseY
  }

  void update() {
    
    noiseX += 0.05; //pareil que noiseX = noiseX + 0.05
    noiseY += 0.05;
    xpos += (noise(noiseX) -0.5)*4;
    ypos += (noise(noiseY) -0.5)*4;

    //
    if (xpos-50>width) { 
      xpos = xpos - (width-50);
    }
    //
    if (xpos+50<0) {
      xpos = xpos + (width+50);
    }
    //
    if (ypos-50>height) {
      ypos = ypos - (height-50);
    }
    //
    if (ypos+50<0) {
      ypos = ypos + (height+50);
    }
    //
  }

  void display() {
        noStroke();

    
    fill(random(50),random(255),random(50),random(255));
    ellipse(xpos, ypos, random(20,25), random(20,25));
       fill(255);
    ellipse(xpos, ypos, random(15,20), random(15,20));
    
    
  }
}
