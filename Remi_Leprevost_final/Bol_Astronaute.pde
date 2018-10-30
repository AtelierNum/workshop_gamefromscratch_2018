class BAstron { // creation de la  boule vert

  float posX ;
  float posY ;

  BAstron () {
    posX= random(width); // donne des coordonné random de spawn compris dans la fenetre
    posY= random(height);
  }

  void display () { // cree une boule verte
    stroke (0, 200, 0);
    strokeWeight (5);
    fill (0, 255, 0);
    ellipse (posX, posY, 25, 25);
  }
}
