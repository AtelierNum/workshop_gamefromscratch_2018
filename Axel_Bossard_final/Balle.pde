
class Balle {
  float x = 0;
  float y = 0;
  float sensibility = 0.2;

  //objet lui même
  Balle(float x, float y) {
    this.x = x; //this demande la variable locale
    this.y = y;
  }

//==================================================================================================

  void display() { //permet d'afficher la balle
    stroke(255, 255, 255);
    strokeWeight(3);
    noFill();
    ellipse(x, y, 50, 50);
  }

  float attraction(float X, float Y, float coef) {
    return X = (Y-X)*coef+X;
  }
  
//==================================================================================================

  void update(float a, float b) {
    x = attraction(x, a, sensibility); 
    y = attraction(y, b, sensibility);
  }
}
