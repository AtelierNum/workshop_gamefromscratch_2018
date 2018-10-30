class Astero {  

  float posX ;
  float posY ;

  float posX2;
  float posY2;
  
  float tr;
  float col;

  float taille;
  float vit;
  float rX1, rX2, rX3, rX4, rY1, rY2, rY3, rY4;

  Astero () {
    tr = random(10,150);
    vit = random (1.0, 5.0);
    posX = random(-width);// donne des coordonné random de spawn compris en dehors de la fenetre
    posY = random(-height);
    col = random (30, 100 );
    
  }

  void display () {

    stroke (col, col, col); // cree des asteroid avec des couleur aleatoire compris dans une certain valeur de gris
    fill (col, col, col); 
    ellipse (posX, posY, tr, tr);
  }
  void update () { // definit la vitesse et la position de mes asteroid pour qu il se avec un vitesse aleatoire et la meme direction ( en dehors de l ecran )
    posX=posX+vit;
    posY=posY+vit; 
  }
}
