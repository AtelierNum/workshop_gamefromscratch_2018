
class Agent {                //Cette classe Agent gère les petites bulles qu'il faut collecter

  float xoff = 0.0;
  float yoff = 0.0;

  float xpos;
  float ypos;


  Agent(float x, float y) {   //Ici on associe xpos et ypos à un flottant, qui sera random
    xoff = random(5);
    yoff = random(5);
    xpos = x;
    ypos = y;
  }


   void display(PImage imgspermato) {   //Ici on rentre les paramètres qui permettrons à une image d'apparître à la place des bulles
    // fill(#FFF705);
    image(imgspermato, xpos, ypos);
  }


  void update() {

    xoff = xoff + 0.01;
    xpos = xpos + (noise(xoff)-0.5) * 4;

    yoff = yoff + .01;
    ypos = ypos + (noise(yoff)-0.5) * 4;

    if (xpos < -20) {              // wrapping qui permet aux bulles de disparaître d'un côté en réapparaissant de l'autre
      xpos = xpos + width + 20;   //on dit que si la posistion de la bulles dépasse de l'écran, alors une nouvelle position est définie: la taille de la fenêtre plus la taille de la bulle
    }
    if (ypos < -20) {
      ypos = ypos + height + 20;
    }
    if (xpos > width + 20) {
      xpos = xpos + width - 20;
    }
    if (ypos > height + 20) {
      ypos = ypos + height - 20;
    }
  }
}

class Agent2 {  //Cette classe gère nos petites bulles à ne pas attraper

  float xoff = 0.0;
  float yoff = 0.0;

  float xpos;
  float ypos;

  Agent2(float x, float y) {   
    xoff = random(5);
    yoff = random(5);
    xpos = x;
    ypos = y;
  }


  void display(PImage imgchlamy) {
    // fill(#FFF705);
    image(imgchlamy, xpos, ypos);
  }


  void update() {

    xoff = xoff + 0.01;
    xpos = xpos + (noise(xoff)-0.5) * 4;

    yoff = yoff + .01;
    ypos = ypos + (noise(yoff)-0.5) * 4;

    if (xpos < -20) {              
      xpos = xpos + width + 20;  
    }
    if (ypos < -20) {
      ypos = ypos + height + 20;
    }
    if (xpos > width + 20) {
      xpos = xpos + width - 20;
    }
    if (ypos > height + 20) {
      ypos = ypos + height - 20;
    }
  }
}

class Bonus {  //Cette classe gère nos petites bulles bonus
  float xoff = 0.0;
  float yoff = 0.0;

  float xpos;
  float ypos;

  

  Bonus(float x, float y) {   
    xoff = random(5);
    yoff = random(5);
    xpos = x;
    ypos = y;
    
  }

 

  void display(PImage imgbonus) {
    // fill(#FFF705);
    image(imgbonus, xpos, ypos);
  }


  void update() {

    xoff = xoff + 0.01;
    xpos = xpos + (noise(xoff)-0.5) * 4;

    yoff = yoff + .01;
    ypos = ypos + (noise(yoff)-0.5) * 4;

    if (xpos < -20) {             
      xpos = xpos + width + 20;  
    }
    if (ypos < -20) {
      ypos = ypos + height + 20;
    }
    if (xpos > width + 20) {
      xpos = xpos + width - 20;
    }
    if (ypos > height + 20) {
      ypos = ypos + height - 20;
    }
  }
}


class Malus { //cette classe gère nos petites bulles malus
  float xoff = 0.0;
  float yoff = 0.0;

  float xpos;
  float ypos;

  Malus(float x, float y) {   
    xoff = random(5);
    yoff = random(5);
    xpos = x;
    ypos = y;
  }

  void display(PImage imgmalus) {
    //fill(#FF05EF);
    image(imgmalus, xpos, ypos);
  }


  void update() {

    xoff = xoff + 0.01;
    xpos = xpos + (noise(xoff)-0.5) * 4;

    yoff = yoff + .01;
    ypos = ypos + (noise(yoff)-0.5) * 4;

    if (xpos < -20) {             
      xpos = xpos + width + 20;  
    }
    if (ypos < -20) {
      ypos = ypos + height + 20;
    }
    if (xpos > width + 20) {
      xpos = xpos + width - 20;
    }
    if (ypos > height + 20) {
      ypos = ypos + height - 20;
    }
  }
}



class Ball {  //cette classe gère notre pointeur

  float xpos;
  float ypos;

  Ball(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
  }

  void display() {
    fill(255);
    ellipse(xpos, ypos, 50, 50); //Ici on à laissé l'ellipse car le fichier ajouté dans l'autre partie est aussi une ellipse de la même dimension
  }

  float attract(float target, float position, float sensibility) {  //cette formule sert à déterminer l'attraction de la balle par la souris
    return (target - position)* sensibility + position;
  }

  void update(float xtarget, float ytarget, float sensibility) {  
    xpos = attract (xtarget, xpos, sensibility);
    ypos = attract (ytarget, ypos, sensibility);
  }
}

class Level { //Cette classe gère nos niveaux, elle permet d'en ajouter à volonté grâce au tableau ArrayList

  int fBlanc;   //ici on définit les variables de nos paramètre: nombre de pop par frame, nombre de bulles maximum dans un niveau...
  int fRouge;
  int fJaune;
  int fRose;
  int scoreMax;
  int nb;
  int nb2;
  int nb3;
  int nb4;

  Level(int fBlanc, int fRouge, int fJaune, int fRose, int scoreMax, int nb, int nb2, int nb3, int nb4) {  //Ici on définit dans quel ordre seront rentré les paramètres
    this.fBlanc = fBlanc;
    this.fRouge = fRouge;
    this.fJaune = fJaune;
    this.fRose = fRose;
    this.scoreMax = scoreMax;
    this.nb = nb;
    this.nb2 = nb2;
    this.nb3 = nb3;
    this.nb4 = nb4;
  }
}
