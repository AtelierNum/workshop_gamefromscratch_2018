class Agent { // creation de la classe Agent

  float xDirCool = 0.0; // creation de la variable qui correspond a la direction en x des instance de la classe Agent
  float yDirCool = 0.0; //// creation de la variable qui correspond a la direction en y des instance de la classe Agent
  float xpos; // creation de la variable qui correspond a la position de x des Arc en ciel( bonus de point)
  float ypos; // creation de la variable qui correspond a la position de y des Arc en ciel ( bonus de point)

  Agent() {

    xDirCool= random(5); // La variable directionnel est aletoire en (5,5) pour x
    yDirCool= random(5); // La variable directionnel est aletoire en (5,5) pour y
    xpos= random(width); // position aleatoire de xpos lors de l'appartion
    ypos=random(height); // position aleatoire de ypos lors de l'apparition
  }

  void display(PImage img) { // fonction qui rentre les caracteristiques des instance de classes 
    //fill(255, 255, 0); 
    //stroke(255);
    image (img, xpos, ypos, 70, 40); // caracteristiques: l'image correspondante, position et hauteur et largeur
  }
  void update(float VitBubbles) { // fonction qui calcul la vitesse de deplacement des instances d'objet pour x
    xDirCool = xDirCool + 0.01;
    xpos = xpos+ (noise(xDirCool)-0.5) * VitBubbles; // déplacement plus fluide et naturelle grace a la fonction noise de coefficient 20 qui joue sur la rapiddité et la fluidité

    yDirCool = yDirCool + 0.01;
    ypos = ypos+ (noise(yDirCool)-0.5) * VitBubbles;
  }
  void wrapping() { // fonction qui permet aux bonus de point de sortir de l'écran et de revenir coter opposé 
    if (xpos<0) { // grace a la boucle si qui permet de definir lorsque la position du bonus de point est en dessous de zero alors ce meme bonus revient coter opposé
      xpos= width;
    } else if (xpos>width) {
      xpos= 0;
    } else if (ypos<0) { // ...
      ypos=height;
    } else if (ypos>height) {
      ypos= 0;
    }
  }
}
