class Ennemis2 {

  float xDirMechant2 = 0.0;
  float yDirMechant2 = 0.0;


  float xpos3;
  float ypos3;

  Ennemis2 () {
    xDirMechant2=random(5); //position cible en x des bulles est aléatoire
    yDirMechant2=random(5); //idem sur y
    xpos3 = random(width); //position d'apparition des bulles aléatoire sur x
    ypos3 = random(height); //idem sur y
  }

  void display(PImage img) {
    //fill(0); //remplissage noir des bulles à attraper
    //stroke (255); // contour blanc
    //strokeWeight (2); //épaississement du contour
    image (img, xpos3, ypos3, 170, 130); //paramètres des bulles à attraper
  }

  void update(float vitNoir2) {
    xDirMechant2 = xDirMechant2 + 0.01;
    xpos3 = xpos3+ (noise(xDirMechant2)-0.5) *vitNoir2; //permet aux bulles de se déplacer "neturellement" et assez rapidement grâce au coeff *20

    yDirMechant2 = yDirMechant2 + 0.01; 
    ypos3 = ypos3+ (noise(yDirMechant2)-0.5) * vitNoir2; //idem sur y
  }
  void wrapping () { //si bulle disparaît par un côté, elle réapparait à son opposé
    if (xpos3<0) {
      xpos3=width;
    } else if (xpos3>width) {
      xpos3=0;
    } else if (ypos3<0) {
      ypos3=height;
    } else if (ypos3>height) {
      ypos3=0;
    }
  }
}
