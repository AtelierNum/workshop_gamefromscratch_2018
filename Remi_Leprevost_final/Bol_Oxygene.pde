class BOxy {

  float posX ;
  float posY ;

  BOxy () {
    posX= random(width);// donne des coordonné random de spawn compris dans la fenetre
    posY= random(height);
  }

  void display () { // cree une boule bleu
    stroke (0, 200, 200);
    strokeWeight (5);
    fill (0, 255, 255);
    ellipse (posX, posY, 20, 20);
  }
}
