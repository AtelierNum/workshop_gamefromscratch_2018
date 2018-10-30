// CLASSE POINT BLANC (CAPSULES)

class Point {

  float xoff = 0.0;
  float yoff = 0.0;

  float B =random(0, TWO_PI);
  float coeef = random(0.01, 0.10);
  float xpos;            //définr la variable
  float ypos;

  Point() {        //CONSTRUCTEUR
    xoff = random(5);
    yoff = random(5);
    xpos = random(width);      
    ypos = random(height);
  }  
  // FONCTION AFFICHER 
  void display() {
    imageMode(CENTER);
    pushMatrix();
    B+= coeef;
    translate(xpos, ypos);
    rotate(B);
    image(img2, 0, 0, 25, 25);

    popMatrix();
  }
  // FONCTION VITESSE ET DEPLACEMENT 
  void update() {
    xoff = xoff + 0.01;
    xpos = xpos + (noise(xoff)-0.5) * 3;

    yoff = yoff + 0.01;
    ypos = ypos + (noise(yoff)-0.5) * 3;
  }
  // FONCTION WRAPPING POUR QU IL REAPPARAISSE D UN AUTRE COTE SANS SE BLOQUER 
  void wrapping() {
    if (xpos <= (0-25)) {
      xpos =(width);
    }
    if (xpos >= (width+25)) {
      xpos = (0);
    }

    if (ypos >= (height+25)) {
      ypos = (0);
    }

    if (ypos <=(0-25)) {
      ypos = (height);
    }
  }
}
