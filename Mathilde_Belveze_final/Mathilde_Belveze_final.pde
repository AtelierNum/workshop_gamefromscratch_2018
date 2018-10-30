
PImage win;//variable image victoire
PImage imgSouris;//variable image curseur
PImage imgFond;//variable image fond
PImage balleRouge;
PImage Bb;
PImage lose;
PImage bonusVert;
int score = 0;
int currentLevel = 0;
float X = 0;
float Y = 0;
float v = 0.05;

import processing.sound.*;//import des sons pop via sound
SoundFile blancoPop;
SoundFile rougePop;
SoundFile larmes;

import ddf.minim.*;//import des sons pop via minim
AudioPlayer player;
Minim minim;
AudioPlayer bPop;
Minim blanc;

//import processing.sound.*;
//SoundFile sf;

//SoundFile sonBlanc;

ArrayList<Agent> bubbles = new ArrayList();//création tableau boule blanches

ArrayList<Bonus> bubblesBonus = new ArrayList();//création tableau boule bonus

ArrayList<Agent2> bubblesr = new ArrayList();//création tableau boule rouges

ArrayList<Lvl> Lvls = new ArrayList();//création tableau niveaux

void setup() {
  size(800, 800, P2D);

  win = loadImage("good end.png");//import des images
  imgSouris = loadImage ("curseur processing.png");
  imgFond = loadImage ("back processing 2.png");
  balleRouge = loadImage("boule rouge.png");
  lose = loadImage("bad end.png");
  Bb = loadImage("ame = boule blanche.png");
  bonusVert = loadImage("bonus.png");

  minim = new Minim(this);//import dela musique
  player = minim.loadFile("ambiance.mp3", 2048);
  player.play();
  player.loop();
  //if (score>= 0);
  //player.stop();

  blancoPop = new SoundFile(this, "gagnepoint.mp3");
  rougePop = new SoundFile(this, "perdupoint.mp3");
  larmes = new SoundFile(this, "pleurs.mp3");

  Lvls.add(new Lvl( 60, 5, 1, 500, 30, 10, 1 ));//application des niveaux
  Lvls.add(new Lvl( 60, 5, 1, 1000, 40, 20, 1));
  Lvls.add(new Lvl( 60, 4, 3, 1500, 40, 35, 3));
  Lvls.add(new Lvl( 60, 3, 4, 2000, 50, 45, 4));
  Lvls.add(new Lvl( 60, 2, 5, 2500, 50, 60, 5));
  Lvls.add(new Lvl( 60, 1, 5, 3000, 50, 80, 5));
}

void draw() {
  motionBlur(90);//application de la trainée

  background(imgFond);
  fill(#C1D9FF);
  textSize(32);//texte sur l'ecran
  text("score"+score, 10, 30);


  X = lerp(X, mouseX, v);//assigner directions x à la souris
  Y = lerp(Y, mouseY, v);//assigner directions y à la souris

  noFill();
  image(imgSouris, X, Y);//ellipse assignée a X Y


  if (frameCount%Lvls.get(currentLevel).fBlanc ==0&& bubbles.size()<Lvls.get(currentLevel).nb) {
    bubbles.add(new Agent(random (width), random (height)));//ajout des buubles dans le framecount
  }

  if (frameCount%Lvls.get(currentLevel).fBonus ==0&& bubblesBonus.size()<Lvls.get(currentLevel).nbb) {
    bubblesBonus.add(new Bonus(random (width), random (height)));//ajout des buubles dans le framecount
  }

  if (frameCount%Lvls.get(currentLevel).fRouge ==0&& bubblesr.size()<Lvls.get(currentLevel).nb2) {
    bubblesr.add(new Agent2(random (width), random (height)));//ajout des buubles dans le framecount
  }

  for (int i = 0; i <bubbles.size(); i++) {//boucle for pour bubbles
    Agent a = bubbles.get (i);
    a.display(Bb);
    a.update();
    if (dist(a.xpos, a.ypos, X, Y) <= 15) {//determiner le champs d'apparition et du mouvement des bulles 
      bubbles.remove(i);//les bulles disparaissent quand l'ellipse les touche
      score = score + 50;
      blancoPop.play();
    }
  }

  for (int i = 0; i <bubblesBonus.size(); i++) {//boucle for pour bubbles
    Bonus a = bubblesBonus.get (i);
    a.display(bonusVert);
    a.update();
    if (dist(a.xpos, a.ypos, X, Y) <= 15) {//determiner le champs d'apparition et du mouvement des bulles 
      bubblesBonus.remove(i);//les bulles disparaissent quand l'ellipse les touche
      score = score + 100;
      blancoPop.play();
    }
  }

  for (int i = 0; i <bubblesr.size(); i++) {//boucle for pour bubbles
    Agent2 a = bubblesr.get (i);
    a.display(balleRouge);
    a.update();
    if (dist(a.xpos, a.ypos, X, Y) <= 15) {//determiner le champs d'apparition et du mouvement des bulles 
      bubblesr.remove(i);//les bulles disparaissent quand l'ellipse les touche
      score = score - 100;
      rougePop.play();
    }
  }

  text("niveau "+ currentLevel, (width -150), 30);//affichage des niveaux sur le jeu

  if (score> Lvls.get(currentLevel).scoreMax) {//affichage des changements de niveaux sur le jeu
    currentLevel++;
  }

  if (score<0) {//images et sons appliqués au changement du score
    image(lose, 0, 0, width, height);
    if (larmes.isPlaying() == false) larmes.play();
   
  }
  if (score >= 3000) {
    image(win, 0, 0, width, height);
  }
}

void motionBlur(int transparency) {//création de la trainée
  fill(150, transparency);
  rect(0, 0, width, height);
}
