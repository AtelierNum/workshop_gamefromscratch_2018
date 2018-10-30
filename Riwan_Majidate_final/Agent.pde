class Agent {

  float xDirGentil = 0.0;
  float yDirGentil = 0.0;


  float xpos;
  float ypos;

  Agent() {
    xDirGentil=random(5); //position cible en x des bulles est aléatoire
    yDirGentil=random(5); //idem sur y
    xpos = random(width); //position d'apparition des bulles aléatoire sur x
    ypos = random(height); //idem sur y
  }


  void display(PImage img) {
    //fill(255); //remplissage blanc des bulles à attraper
    image(img, xpos, ypos, 80, 80); //paramètres des bulles à attraper
  }

  void update(float vitBlanc) {
    xDirGentil = xDirGentil + 0.01;
    xpos = xpos+ (noise(xDirGentil)-0.5) * vitBlanc; //permet aux bulles de se déplacer "neturellement" et assez rapidement grâce au coeff *20

    yDirGentil = yDirGentil + 0.01; 
    ypos = ypos+ (noise(yDirGentil)-0.5) * vitBlanc; //idem sur y
  }



  void wrapping () { //si bulle disparaît par un côté, elle réapparait à son opposé
    if (xpos<0) {
      xpos=width;
    } else if (xpos>width) {
      xpos=0;
    } else if (ypos<0) {
      ypos=height;
    } else if (ypos>height) {
      ypos=0;
    }
  }
}
