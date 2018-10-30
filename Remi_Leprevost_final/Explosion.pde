class Expl {

  float posX ;
  float posY ;

  Expl () {
    posX= random(width);
    posY= random(height);
  }

  void display () { // cree une boule rouge
    stroke (200, 0, 0);// donne des coordonné random de spawn compris dans la fenetre
    strokeWeight (5);
    fill (255, 0, 0);
    ellipse (posX, posY, 10, 10);
  }
}

class Dest {

  

  Dest () {
  }

  void display (float posX, float posY) { // cree le cercle de destruction 
    fill (255, 0, 0, 50);
    ellipse (posX, posY, 500, 500);
  }
}
