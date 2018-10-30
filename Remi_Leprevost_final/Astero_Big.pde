class AsteroB {  

  float posX ;
  float posY ;
  float col;
  float taille;
  float vit;

  AsteroB () {

    vit = random (1.0, 5.0);
    posX = random(-height);// donne des coordonné random de spawn compris en dehors de la fenetre
    posY = random(-width);
    col = random (30, 100 );
  }

  void display () {

    stroke (col, col, col); // cree des asteroid avec des couleur aleatoire compris dans une certain valeur de gris
    fill (col, col, col); 
    ellipse (posX, posY, 200, 200);
  }
  void update () {// definit la vitesse et la position de mes asteroid pour qu il se avec un vitesse aleatoire et la meme direction ( en dehors de l ecran )
    posX=posX+vit;
    posY=posY+vit;
  }
}
