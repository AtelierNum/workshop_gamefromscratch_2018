//Création d'une classe
class Balle {
  float xpos = random (height);
  float ypos = random (width);

  Balle(float xpos, float ypos) { //création de l'objet balle
    this.xpos = xpos;
    this.ypos = ypos;
  }
  void display () {  //Initialisation des caractèristiques visuel de l'ellipse
    noFill();
    strokeWeight (5);
    stroke (#FFEB03);
    ellipse (xpos, ypos, 50, 50);
  }
  float attracte (float p, float t, float s) {  
    return (t-p)*s+p;
  }
  void update (float xT, float yT, float s) {  
    xpos = attracte (xpos, xT, s);
    ypos = attracte (ypos, yT, s);
  }
}
