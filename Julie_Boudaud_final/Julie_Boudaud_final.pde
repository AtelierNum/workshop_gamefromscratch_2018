// BOUDAUD Julie, GA2 2018/2019

// Green Dino

import processing.sound.*;
PImage img;
// image game over
PImage img2;
// image victoire
PImage imgcurseur;
// image dino
PImage imgplante;
//image plante
PImage imgmeteorite;
//météorite image
PImage imgpoulet;
//image poulet
PImage imgos;
//image os
PImage imgfo;
int nb = 15;
int nb2 = 8;
int nb3 = 5;
int nb4 = 10;
float X = 0;
float Y = 0;
float xpos;
float ypos;
int score = 0; 
int currentLevel = 1;
float V = 0.05;


SoundFile fond;

SoundFile food;

SoundFile burp;

SoundFile boom;

SoundFile vomit;

SoundFile victory;

//liste son utilisé 



ArrayList<Agent> tab2 = new ArrayList<Agent>();

//bulle bien

ArrayList<Agent2> bubblesr = new ArrayList<Agent2>();

// bulle mal

ArrayList<Agent3> bubblesb = new ArrayList<Agent3>();

//bulle bonus

ArrayList<Agent4> bubblesm = new ArrayList<Agent4>();

//bulle malus

ArrayList<Level> lvl = new ArrayList();

//tableau pour les niveaux

Ball ball;

void setup() {
  size(800, 800);

  //Taille du cadre



  fond = new SoundFile(this, "Garden.mp3");
  fond.loop();

  food = new SoundFile(this, "Eating2.mp3");

  burp = new SoundFile(this, "burps3.wav");

  boom = new SoundFile(this, "explosion.wav");

  vomit = new SoundFile(this, "gagging2.wav");

  victory = new SoundFile(this, "leveledup.mp3");

  // mes musiques + le nom du fichier



  ball = new Ball(0, 0);

  // creation de ma balle curseur



  img = loadImage("Gameover2.png");

  // image game over

  img2 = loadImage("victoiredino.png");

  // image victoire

  imgcurseur = loadImage("dinodino.png");

  // image Dino

  imgplante = loadImage("plante1.png");

  // image plante

  imgmeteorite = loadImage("meteorite2.png");

  // image météorite

  imgpoulet = loadImage("poulet.png");

  //image poulet

  imgos = loadImage("os.png");

  //image os

  imgfo = loadImage("paysage5.png");

  // image fond + nom fichier

  lvl.add(new Level(90, 90, 90, 90, 1000, 5, 5, 3, 5));
  lvl.add(new Level(90, 80, 90, 80, 2000, 10, 10, 5, 10));
  lvl.add(new Level(70, 50, 70, 50, 3000, 20, 15, 10, 15));
  lvl.add(new Level(50, 30, 50, 30, 4000, 25, 20, 10, 25));
  lvl.add(new Level(40, 20, 40, 20, 5000, 30, 30, 15, 35));
  lvl.add(new Level(30, 10, 30, 10, 6000, 35, 40, 15, 45));

  //création des lvl
  //(00, = frame boule blanche , 00,00 = frame boule rouge, 00,00,00 = score, 00,00,00,00 = nb , 00,00,00,00,00 = nb2)
  // ce qui va pimenter le jeu = creation niveau + nombre de mechant / gentil + frame
}


void draw() {

  motionBlur(90);

  background(imgfo);

  //image de fond



  fill(#FCFCFC);
  textSize(32);
  text("score"+score, 10, 30); 

  // Creation d'un texte "score"


noCursor();
  X = lerp(X, mouseX, V);
  Y = lerp(Y, mouseY, V);
  image(imgcurseur, X - 35, Y - 25, 70, 53);

  //commande position ellipse + faire disparition des bulles qu'elle touche



  if (frameCount%lvl.get(currentLevel).fBlanc ==0 && tab2.size()<lvl.get(currentLevel).nb) {
    tab2.add(new Agent(random(width), random(height)));
  }

  if (frameCount%lvl.get(currentLevel).fRouge ==0 && bubblesr.size()<lvl.get(currentLevel).nb2) {
    bubblesr.add(new Agent2(random(width), random(height)));
  }

  if (frameCount%lvl.get(currentLevel).fJaune ==0 && bubblesb.size()<lvl.get(currentLevel).nb3) {
    bubblesb.add(new Agent3(random(width), random(height)));
  }

  if (frameCount%lvl.get(currentLevel).fBleu ==0 && bubblesm.size()<lvl.get(currentLevel).nb4) {
    bubblesm.add(new Agent4(random(width), random(height)));
  }

  // nb = nombre de boules que je veux sur mon interface
  // FrameC = nb d'image 
  //bulles bien



  for (int i = 0; i < tab2.size(); i++) {
    Agent a = tab2.get(i);
    a.display();
    a.update();
    if (dist(a.xpos, a.ypos, X, Y)<=15) {
      tab2.remove(i);
      score = score + 50;
      V = 0.08;
      food.play();
    }
  }

  //bulle bien + condition de la boule

  for (int i = 0; i < bubblesr.size(); i++) {
    Agent2 a = bubblesr.get(i);
    a.display();
    a.update();
    if (dist(a.xpos, a.ypos, X, Y)<=15) {
      bubblesr.remove(i);
      score = score -400;
      vomit.play();
    }
  }

  //bulle mal + condition de la boule

  for (int i = 0; i < bubblesb.size(); i++) {
    Agent3 a = bubblesb.get(i);
    a.display();
    a.update();
    if (dist(a.xpos, a.ypos, X, Y)<=15) {
      bubblesb.remove(i);
      score = score +200;
      V = +0.3;
      burp.play();
    }
  }

  //bulle bonus + condition de la boule

  for (int i = 0; i < bubblesm.size(); i++) {
    Agent4 a = bubblesm.get(i);
    a.display();
    a.update();
    if (dist(a.xpos, a.ypos, X, Y)<=15) {
      bubblesm.remove(i);
      score = score -1000;
      V = -0.02;
      boom.play();
    }
  }

  //bulle malus + condition de la boule

  // 15 = porté 
  // for = savoir qu'il y a des bulles 
  // if condition, si la bulle touche l'autre alors elle disparait



  text("Niveau"+currentLevel, (width - 150), 30);
  if (score>lvl.get(currentLevel).scoreMax) {
    currentLevel++;
  }

  //integrer l'affichage du niveau 



  if (score<0) {
    image(img, 0, 0, width, height);
    fond.stop();
  }

  // image game over

  if (score>=6000) {
    image(img2, 0, 0, width, height);
    fond.stop();
    victory.play();
    noLoop();
  }

  // image victoire
}



void motionBlur(int transparency) {
  fill(150, transparency);
  rect(0, 0, width, height);
}

// Active un flou / transparence des boules qui suivent mon curseur
