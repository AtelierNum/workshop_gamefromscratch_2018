class Cercle { //créer une classe permet d'appeler un objet sans avoir à redéfinir à chaque fois ses variables
  float x = width/2; //définition de la position x de l'ellipse
  float y = height/2; //définition de la position y de l'ellipse

  Cercle(float x, float y) {
    this.x=x;
    this.y=y;
  }
  void display(PImage img) {

    // stroke (255); // contour blanc
    //  strokeWeight (3); //épaississement du contour
    // fill(121, 28, 248, 240); //remplissage pour les formes définis ci-dessous
    image (img, x, y, 80, 90); //un cercle dont l=80p, h=80p, et coordonnées x,y
  }

  void update(float XSouris, float YSouris, float latence) { //création fonction update, terme1=XSouris, terme2=YSouris, terme3=latence
    x= attract(x, XSouris, latence); //fromule appelle le calcul de la fnctn attract avec nouvelle valeur => nouveau calcul
    y= attract(y, YSouris, latence); //idem mais pour Y
  }

  float attract(float posEllipse, float posSouris, float sensi) { //la valeur mouseX est remplacée par la valeur posEllipse, la valeur x est remplacée par la valeur posSouris, etc.
    return (posSouris-posEllipse)*sensi+posEllipse; //le calcul permet de faire avancer l'ellipse vers la souris avec une vitesse décroissante mais toujours positive
    //attract prend la valeur de result
  }
}
