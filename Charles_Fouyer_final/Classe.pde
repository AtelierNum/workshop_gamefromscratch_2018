class Balle { // creation de la classe Balle qui reprend les parametres et les caracteristiques de la forme initiale crée prealablement 
  float x = width/2 ; // création d'une varibale qui definie la position de l'ellipse
  float y = height/2; //  création d'une varibale qui definie la position de l'ellipse

  Balle(float x, float y) { 
    this.x=x;
    this.y=y;
  }

  void display(PImage img) {
    // fill(255); // couleur ellipse
    //stroke(225); // couleur contour
    image (img, x, y, 100, 100); //creation ellipse
  }

  float attraction(float t, float p, float s) {
    float result =(t-p)*s+p; //calcul de la fonction
    return result;// attraction=result
  }

  void update(float XSouris, float YSouris, float Latence ) {  // 

    x= attraction( XSouris, x, Latence); // creation d'une latence entre la souris et l'ellipse
    y= attraction( YSouris, y, Latence);// ""
  }
} 
