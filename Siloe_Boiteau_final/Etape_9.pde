PImage img;         //Ici on définit nos variables d'images
PImage img2;
PImage imgpointeur;
PImage imgfond;
PImage imgbonus;
PImage imgmalus;
PImage imgspermato;
PImage imgchlamy;

int score = 0;           //Ici on définit nos varibales de score et de niveau
int currentLevel = 1;

float X = 0;           //Ici on définit les variables de position X et Y, ainsi que la vitesse du curseur V
float Y = 0;
float V = 0.05;
  
import processing.sound.*;   //Ici définit nos variables de sons et bruitages
SoundFile fond;

import processing.sound.*;
SoundFile plop;

import processing.sound.*;
SoundFile babylaught;

import processing.sound.*;
SoundFile babycry;

ArrayList<Agent> bubbles = new ArrayList();  //Ici on créer nos tableaux ArrayList pour pouvoie "déployer" nos petites bulles

ArrayList<Agent2> bubblesr = new ArrayList();  

ArrayList<Bonus> bubblesj = new ArrayList();

ArrayList<Malus> bubblesro = new ArrayList();

ArrayList<Level> lvl = new ArrayList();

Ball ball;


void setup() {
  size (800, 800);    
  ball = new Ball(0, 0);
  
    plop = new SoundFile(this, "pop.mp3");                   //Ici on associe notre variable de son avec le fichier souhaité
    fond = new SoundFile(this, "Cast_of_Pods.mp3");
    fond.loop();
    babylaught = new SoundFile(this, "0232.mp3"); 
    babycry = new SoundFile(this, "7983.wav");
    
    
  lvl.add(new Level(10, 900, 90, 90, 0, 100, 10, 0, 0));   //Ici on ajoute le nombre de niveaux souhaité, et on rentre les paramètres prédéfinis dans notre classe Level
  lvl.add(new Level(10, 50, 90, 90, 1000, 50, 20, 2, 2));
  lvl.add(new Level(20, 30, 90, 90, 2000, 40, 40, 4, 4));
  lvl.add(new Level(30, 10, 90, 90, 3000, 30, 80, 6, 6));
  lvl.add(new Level(50, 2, 150, 150, 5000, 20, 80, 8, 8));

  
  img = loadImage("gameover.png");    //Ici on associe notre variable d'image avec le fichier souhaité
  img2 = loadImage("Victoire.png");
  imgpointeur = loadImage("ovule.png");
  imgfond = loadImage("decor.png");
  imgbonus = loadImage("LS.png");
  imgmalus = loadImage("pillule.png");
  imgspermato = loadImage("spermato.gif");
  imgchlamy = loadImage("chlamydia.png");
  

 
}


void draw () {
 
  background(imgfond);         //Ici on appelle la variable qui affiche le fond
  
   fill(#FF4BB7);              //Ici on entre nos paramètres pour afficher le score
  textSize(32);
  text("score"+score, 10, 30);
fill(#FF4D7D);
text("Niveau"+currentLevel, (width - 150), 30);    

  motionBlur(90);       //Ici on règle la transparence du fond grâce à la fonction créée motionBlur

  X = lerp(X, mouseX, V);
  Y = lerp(Y, mouseY, V);
  
  image(imgpointeur, X-25, Y-25, 50, 50);  //Ici on associe une image à notre pointeur

  if (frameCount%lvl.get(currentLevel). fBlanc == 0 && bubbles.size()<lvl.get(currentLevel).nb) {             //FrameCount permet de compter les frammes. Ici, on dit que si on est à la 25ème frame, on créer une nouvelle bulle, on dit aussi de ne pas dépasser le nombre défini auparavant
    bubbles.add(new Agent(random(width), random(height)));    //avec random associé à width et height, on permet aux bulles de pop n'importe où dans l'espace de la fenêtre
  }
  if (frameCount%lvl.get(currentLevel).fRouge == 0 && bubblesr.size()<lvl.get(currentLevel).nb2) {            
    bubblesr.add(new Agent2(random(width), random(height)));    
  }
  if (frameCount%lvl.get(currentLevel). fJaune == 0 && bubblesj.size()<lvl.get(currentLevel).nb3) {       
    bubblesj.add(new Bonus(random(width), random(height)));
  }
   if (frameCount%lvl.get(currentLevel). fRose == 0 && bubblesro.size()<lvl.get(currentLevel).nb4) {       
    bubblesro.add(new Malus(random(width), random(height)));
  }

  for (int i = 0; i<bubbles.size(); i ++) {   //Ici on créer une boucle qui répète le tableau Arraylist et lui fait créer des bulles autant que souhaité
    Agent a = bubbles.get(i);
    a.display(imgspermato);                  
    a.update();
    if (dist(a.xpos, a.ypos, X, Y)<=20) {  //If sert à déterminer la condition: si on touche, alors: 
      bubbles.remove(i);                   //les bulles disparaissent
      score = score +50;                  //le score augmente
      V = 0.05;                            //la vitesse est de tant
        plop.play();                       //On joue tel son
    }
  }
  for (int i = 0; i<bubblesr.size(); i ++) {  
    Agent2 a = bubblesr.get(i);
    a.display(imgchlamy);                  
    a.update();
    if (dist(a.xpos, a.ypos, X, Y)<=15) {  
      bubblesr.remove(i); 
      score = score -500;
        plop.play();
    }
  }
    for (int i = 0; i<bubblesj.size(); i ++) {  
      Bonus a = bubblesj.get(i);
      a.display(imgbonus);                  
      a.update();
      if (dist(a.xpos, a.ypos, X, Y)<=15) { 
        bubblesj.remove(i);
        score = score +200;
        V = V +0.09;
          plop.play();
      }
    }
    for (int i = 0; i<bubblesro.size(); i ++) {   
      Malus a = bubblesro.get(i);
      a.display(imgmalus);                  
      a.update();
      if (dist(a.xpos, a.ypos, X, Y)<=15) {  
        bubblesro.remove(i);
        score = score +0;
        V = V -0.01;
          plop.play();
      }  
    }
        
    if (score>lvl.get(currentLevel).scoreMax) {  //Ici on dit que si le score dépasse celui autorisé par le niveau, alors on passe au niveau supérieur
      currentLevel++;
    }
    if (score>=5000) {                      //Ici on définit les condition des victoire: si le score est de tant, alors:
      image(img2, 0, 0, width, height);     //on affiche telle image
      babylaught.play();                    //on joue tel son
      noLoop();                             //la boucle, et donc le jeu, s'arrête
    }
    if (score<-500) {
      image(img, 0, 0, width, height);      //Idem pour les conditions de défaite
      babycry.play();
      noLoop();
    }
}

void motionBlur(int transparency) {    //motionBlur est une fonction que nous avons créée, qui affiche un rectangle dont on peut régler la transparence
  fill(220, transparency);
  rect(0, 0, width, height);
}
