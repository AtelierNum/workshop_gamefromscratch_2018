import processing.sound.*;
SoundFile Eau;
SoundFile Tar;
SoundFile Fond;
SoundFile LevelUp;
SoundFile Win;
SoundFile Lose;
PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
float X = 0; // position du cercle à dessiner
float Y = 0;
float Fa = 60;
float Fb = 60;
float V = 0.05;
int currentLevel = 0;
int scores = 0;
//ArrayList<Balle> tab = new ArrayList<Balle>(100);
ArrayList<Agent> tab2 = new ArrayList<Agent>();
ArrayList<Bad> tab3 = new ArrayList<Bad>();
ArrayList<LVL> tab4 = new ArrayList <LVL>();


void setup() { //definition de la taille de la fenètre
  size (900, 900, P2D);


  tab4.add (new LVL (50, 65, 20, 25, 30));
  tab4.add (new LVL (50, 45, 40, 20, 30));
  tab4.add (new LVL (40, 40, 60, 20, 20));
  tab4.add (new LVL (40, 30, 80, 15, 15));
  tab4.add (new LVL (30, 25, 100, 15, 15));

  img = loadImage("fish.png");
  img2 = loadImage("gameover.png");
  img3 = loadImage("youwin.png");
  img4 = loadImage("fond.png");
  img5 = loadImage("fish2.png");

  Eau = new SoundFile(this, "Bulle eau.wav");
  Tar = new SoundFile(this, "Bulle tar.wav");
  Fond = new SoundFile(this, "Musique.mp3");
  LevelUp = new SoundFile(this, "Level Up.wav");
  Win = new SoundFile(this, "Win.mp3");
  Lose = new SoundFile(this, "Lose.wav");
  Fond.loop(); // musique de fond
  for (int i = 0; i < 1; i++) {  //Configuration du tableau pour qu'il affiche 100 ellipses à l'aide de la boucle for
    //tab.add(new Balle(random(width), random (height)));
    tab2.add(new Agent());
  }
}

void draw () {
  background(img4);
  text("Niveau " + currentLevel, (width -300), 50);
  //lvl();
  //trainee(85); //integration de la fonction trainée qui permet d'avoir une trainée derrière mon éllipse


  if (scores==tab4.get(currentLevel).scoreMax) { //changement du niveau
    currentLevel = currentLevel + 1; 
    LevelUp.play();
  }

  if (frameCount%tab4.get(currentLevel).fBlanc==0 && tab2.size() < tab4.get(currentLevel).Na ) {
    tab2.add(new Agent());
  }
  if (frameCount%tab4.get(currentLevel).fRouge==0 && tab3.size() < tab4.get(currentLevel).Nb ) {
    tab3.add(new Bad());
  }

  /*if (frameCount%Fa ==0 && tab2.size() < Na) { //Pour Agent
   tab2.add(new Agent());
   }
   if (frameCount%Fb ==0 && tab3.size() < Nb) { // Pour Bad
   tab3.add(new Bad());
   }*/

  for (int i = 0; i < tab2.size(); i++) {  // Bloc pour les Agents
    //Balle part = tab.get(i);
    Agent a = tab2.get(i);
    a.setup();
    a.update(); //appelle des fonctions à utiliser pour la classe
    a.display (); //(random(width), random(height), random (0.001, 0.01));
    if (dist(a.xpos+a.img.width/2, a.ypos + a.img.height/2, X+img.width/2, img.height/2+Y) <= 25) { //fait disparaitres les Agents

      tab2.remove(i); //destruction agent
      scores = scores + 2; // ajout + 2 pnts
      V = +0.05; // ajout 0.01 de vitesse du curseur
      Eau.play();
    }
  }
  for (int i = 0; i < tab3.size(); i++) {  //bloc pour les Bads

    Bad b = tab3.get(i);
    b.setup();
    b.update(); //appelle des fonctions à utiliser pour la classe
    b.display (); //(random(width), random(height), random (0.001, 0.01));
    if (dist(b.xpos +b.img.width/2, b.ypos +b.img.height/2, X +img.width/2, Y+img.height/2) <= 25) { //fait disparaitres les Bads

      tab3.remove(i); // destructions bad
      scores = scores-2; // retirer -2 pts
      V = -0.05; // reteirer 0.01 de vitesse du curseur }
      Tar.play();
    }
  }

  /*if (X < 0 && X > (width) && Y < 0 && Y > (height)) { //Si le poisson sort de l'écran, c'est perdu
   image(img2, 0, 0, width, height);
   }
   */

  X = lerp(X, mouseX, V);
  Y = lerp(Y, mouseY, V);



  //noFill ();  //création d'une ellipse vide avec un contours jaune qui vas suivre la souris
  //stroke (#FFEB03);
  if (mouseX -X >0) {
    pushStyle();
    pushMatrix();
   // imageMode(CENTER);
    translate(X, Y);
    //rotate(PI); 
   
    image(img5, 0, 0);
    popMatrix();
    popStyle();
  } else {
    pushStyle();
    pushMatrix();
   // imageMode(CENTER);
    translate(X, Y);
   // rotate(0);
    image(img, 0, 0);
    popMatrix();
    popStyle();
  }
  // scale(1,1);

  if (X <= (0)) { //Wrap pour le curseur
    X =(width+100);
  }
  if (X >= (width)) { 
    X = (100);
  }
  if (Y <= (0)) { 
    Y =(height+100);
  }
  if (Y >= (height)) { 
    Y =(100);
  }

  if (scores <0) { // si le score est plus petit que 0, c'est perdu
    image(img2, 0, 0, width, height);
    Fond.stop();
    noLoop();
    Lose.play();
  }

  if (scores >= 100) { // si le score est = à 100, c'est gagné
    image(img3, 0, 0, width, height);
    Fond.stop();
    noLoop();
    Win.play();
  }
  fill(#FF8000); //affichage du score
  textSize(32);
  text("Scores : "+scores, 20, 30);
}

void trainee (int a) {
  fill (#009FFF, a);  //Création d'un rectangle à opasité un peu réduite qui laissera une trace derrière l'ellipse qui vas disparaitre avec le temps, l'opasié du rectangle détermine la taille de la trace
  rect(0, 0, height, width);
  //image(img2, height, width);
}

float attracte (float p, float t, float s) {  //re re écriture de la fonction lerp
  return (t-p)*s+p;
}
