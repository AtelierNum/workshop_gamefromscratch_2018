class Ennemis {

  float xDirMechant = 0.0;
  float yDirMechant = 0.0;


  float xpos2;
  float ypos2;

  Ennemis () {
    xDirMechant=random(5); //position cible en x des bulles est aléatoire
    yDirMechant=random(5); //idem sur y
    xpos2 = random(width); //position d'apparition des bulles aléatoire sur x
    ypos2 = random(height); //idem sur y
  }

  void display(PImage img) {
    //fill(0); //remplissage noir des bulles à attraper
    //stroke (255); // contour blanc
    //strokeWeight (2); //épaississement du contour
    image (img, xpos2, ypos2, 80, 80); //paramètres des bulles à attraper
  }

  void update(float vitNoir) {
    xDirMechant = xDirMechant + 0.01;
    xpos2 = xpos2+ (noise(xDirMechant)-0.5) *vitNoir; //permet aux bulles de se déplacer "neturellement" et assez rapidement grâce au coeff *20

    yDirMechant = yDirMechant + 0.01; 
    ypos2 = ypos2+ (noise(yDirMechant)-0.5) * vitNoir; //idem sur y
  }
  void wrapping () { //si bulle disparaît par un côté, elle réapparait à son opposé
    if (xpos2<0) {
      xpos2=width;
    } else if (xpos2>width) {
      xpos2=0;
    } else if (ypos2<0) {
      ypos2=height;
    } else if (ypos2>height) {
      ypos2=0;
    }
  }
}
