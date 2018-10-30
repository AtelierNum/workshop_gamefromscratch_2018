class Agent {//classe correspondant à 
  float X, Y;//coordonnées de l'agent
  float xoff, yoff, increment=0.01;//valeurs en x et y qui seront incrémentés pour faire se déplacer de manière aléatoire notre agent
  float coef;//vitesse de déplacement propre à l'agent
  int Type;//le type d'agent
  int d=30;// diamètre
  Agent(float newX, float newY, int type) {
    X=newX;
    Y=newY;
    xoff=random(0, 100);//valeur random qui va servir pour le déplacement de l'agent
    yoff=random(0, 100);//valeur random qui va servir pour le déplacement de l'agent
    coef=random(3,10);//vitesse random
    Type=type;
  }

  void display() {//affichage des agents

    noStroke();
    switch(Type) {//formule spéciale fonctionnant comme des conditions
    case 0 : 
      tint(255); 
      break;//si type == 0 alors agent de couleur blanche
    case 1 : 
      tint(255, 0, 0); 
      break;//si type == 1 alors agent de couleur blanche
    case 2 : 
      tint(#73FF71); //Vert
      d=15; 
      break;
    case 3 : 
      tint(#9E44E0); //violet
      d=15; 
      break;
    case 4 : 
      tint(#00ACFF); //bleu
      d=20; 
      break;
    case 5 : 
      tint(#FFAA00); //orange
      d=20; 
      break;
    case 6 :
      tint(#FEFF00); //jaune
      d=20;
      break;
    case 7 :
      d=20;  //coeur
      break;
    case 8 : // multicolor
      tint(random(0,255),random(0,255),random(0,255));
      d=20;
    }
    if(Type==7){
      imageMode(CENTER);
     image(coeur,X,Y,d*(coef/10),d*(coef/10));
    }else if(Type==0 || Type==1){
      imageMode(CENTER);
    image(circle,X, Y, d*(coef/10), (d)*(coef/10));
    }else{
      imageMode(CENTER);
    image(circle,X, Y, d, d);
    }
    if (Type==4) { // plus
      fill(255);
      textSize(15*(coef/10));
      textAlign(CENTER,CENTER);
      text("+", X, Y-3);
    } else if (Type==5) { // moins
      fill(255);
      textAlign(CENTER,CENTER);
      textSize(15*(coef/10));
      text("-", X, Y-3);
    }
  }

  void update() {//met à jour les fonctions définies
    move();
    wrapping();
  }

  void move() {//fonction définissant le déplacement de l'objet
    xoff+=increment;//
    yoff+=increment;//incrementation constante pour xoff et yoff, si on diminue "increment" le déplacement de l'agent sera plus "smooth" (et inversement, il sera plus "dans tout les sens)

    X = noiseVal(xoff, coef)+X;//
    Y = noiseVal(yoff, coef)+Y;//on ajoute aux coordonées la valeur obtenue grâce à noise permettant un déplacement plus "naturel";
  }

  void wrapping() {
    if (X>width+d/2) {// si l'agent dépasse la fenêtre à droite
      X=-d/2;       //alors l'agent retourne à gauche
    } else if (X<-d/2) {// si l'agent dépasse la fenêtre à gauche
      X=width+d/2;  //alors l'agent retourne à droite
    }
    if (Y>height+d/2) {// si l'agent dépasse la fenêtre en bas
      Y=-d/2;        //alors l'agent retourne en haut
    } else if (Y<-d/2) {// si l'agent dépasse la fenêtre en haut
      Y=height+d/2;   //alors l'agent retourne en bas
    }
  }

  float noiseVal(float t, float c) {
    return (noise(t)-0.5)*c;//noise(t)-0.5 est compris entre -0.5 et 0.5 permetant le déplacement vers l'avant et vers l'arrière de l'agent
    //le c correspond au coef, plus il est élevé plus l'agent est rapide
  }
}
