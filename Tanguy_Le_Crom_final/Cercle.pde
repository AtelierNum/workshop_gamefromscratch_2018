//Onglet comprennant les Classes


class Cercle {//classe cercle orienté avec la souris
  float X, Y, Xinv, Yinv;//position du cercle controlé par la souris
  float coef;//coeficient de vitesse
  int d;//diamètre de notre agent
  boolean inverse;//booléen si inversion des contrôles
  boolean SuperMode;
  int incrInv, incrSuper;//incréement pour définir une durée à l'inversement
  float cibleX, cibleY;//coordonnés cibles
  int num;
  float score;
  
  Cercle(int X,int Y,int num) {//fonction initialisation 
    coef=0.05;//vitesse random
    this.X=X;//coordonnée de spawn
    this.Y=Y;//coordonnée de spawn
    cibleX=X; 
    cibleY=Y;
    this.num=num;
    d=60;//diametre du cercle de la souris
    inverse=false;//inverse n'est pas actif
    SuperMode=false;
    score=0;
  }

  void display() {//affichage
    stroke(255);
    noFill();
    if(SuperMode){
      tint(random(0,255),random(0,255),random(0,255));
    }
    else if(num==1){ // joueur 1
      tint(#5D81FF);
    }else if(num==2){ // joueur 2
      tint(#BDFF5D);
    }
    image(circle,X, Y, d, d);//cercle affichage
  }

  void update() {//mise à jour de la position
    
    control();//appel de la fonction de controle
    
    if (inverse) {//si on inverse les contrôles

      X=attraction(X, Xinv-cibleX, coef);//le cercle s'éloigne de la souris
      Y=attraction(Y, Yinv-cibleY, coef);//le cercle s'éloigne de la souris
      wrappingInv();
      incrInv++;//incrementation par frame
      if (incrInv>300) {//après tant de frames, on annule l'inversion des contrôles
        inverse=false;
        cibleX=X;
        cibleY=Y;
      }
    } else {
      if(SuperMode){//activation du super mode
        incrSuper++;//incrémentation à chaque frame
        SuperMode();
        if(incrSuper>1000){//jusqu'a tant de frames en mode super
          SuperMode=false;
          incrSuper=0;
        }
      }
      X=attraction(X, cibleX, coef);//le cercle se rapproche de la souris
      Y=attraction(Y, cibleY, coef);//le cercle se rapproche de la souris
      wrapping();
    }

  }

  float attraction(float X, float Y, float coefSpeed) {//la position se rapproche de la souris
    return X+(Y-X)*coefSpeed;//on prend les coordonnées précédents et on ajoute la distance du cercle par rapport à la souris diminué d'un coef pour simulé un rapprochement
  }

  void wrappingInv() {//fonction permettant de récupérer les agents qui sortent de la fenêtre
    if (X>width+d/2) {// si le cercle dépasse la fenêtre à droite
      X=-d/2;  //alors le cercle retourne à gauche
      Xinv-=width;//pour compenser quand le cercle passe de l'autre côté
    } else if (X<-d/2) {// si le cercle dépasse la fenêtre à gauche
      X=width+d/2;  //alors le cercle retourne à droite
      Xinv+=width;   ////pour compenser quand le cercle passe de l'autre côté
    }
    if (Y>height+d/2) {// si le cercle dépasse la fenêtre en bas
      Y=-d/2;        //alors le cercle retourne en haut
      Yinv-=height;//pour compenser quand le cercle passe de l'autre côté
    } else if (Y<-d/2) {// si le cercle dépasse la fenêtre en haut
      Y=height+d/2;   //alors le cercle retourne en bas
      Yinv+=height;//pour compenser quand le cercle passe de l'autre côté
    }
  }
  
  void wrapping() {//fonction permettant de récupérer les agents qui sortent de la fenêtre
    if (X>width+d/2) {// si le cercle dépasse la fenêtre à droite
      X=-d/2;  //alors le cercle retourne à gauche
      cibleX-=width;//pour compenser quand le cercle passe de l'autre côté
    } else if (X<-d/2) {// si le cercle dépasse la fenêtre à gauche
      X=width+d/2;  //alors le cercle retourne à droite
      cibleX+=width;   ////pour compenser quand le cercle passe de l'autre côté
    }
    if (Y>height+d/2) {// si le cercle dépasse la fenêtre en bas
      Y=-d/2;        //alors le cercle retourne en haut
      cibleY-=height;//pour compenser quand le cercle passe de l'autre côté
    } else if (Y<-d/2) {// si le cercle dépasse la fenêtre en haut
      Y=height+d/2;   //alors le cercle retourne en bas
      cibleY+=height;//pour compenser quand le cercle passe de l'autre côté
    }
  }
  
  void SuperMode(){//mode super permettant d'attaquer son adversaire
    if(num==1 && dist(Player[1].X,Player[1].X,Player[0].X,Player[0].X)<Player[0].d/2){//si ils se touchent
        if(!Player[1].SuperMode){//si l'autre n'as pas le superMode
      coeurs2.remove(coeurs2.size()-1);//on lui enleve un coeur
      SuperMode=false;
      incrSuper=0;
      superMusic.stop();
      shrink.play();
        }
    }else if(num==2 && dist(Player[1].X,Player[1].X,Player[0].X,Player[0].X)<Player[0].d/2){//si ils se touche
      if(!Player[0].SuperMode){//si l'autre n'as pas le superMode
      coeurs1.remove(coeurs1.size()-1);//on lui enleve un coeur
      SuperMode=false;
      incrSuper=0;
      superMusic.stop();
      shrink.play();
      }
    }
  
  }
  
  void control(){//controles en fonction des touches et du joueur en question
    int vitesse=4;
    if(num==1){
  if(AisLeft){
  cibleX-=vitesse;;
  }
  if(AisRight){
  cibleX+=vitesse;
  }
  if(AisUp){
  cibleY-=vitesse;
  }
  if(AisDown){
  cibleY+=vitesse;
  }
    }else if (num==2){
    if(BisLeft){
  cibleX-=vitesse;
  }
  if(BisRight){
  cibleX+=vitesse;
  }
  if(BisUp){
  cibleY-=vitesse;
  }
  if(BisDown){
  cibleY+=vitesse;
  }
    }
  
  }
}
