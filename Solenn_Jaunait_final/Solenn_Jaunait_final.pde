import processing.sound.*;
SoundFile filetheme;
SoundFile fileburns;
SoundFile filevie;
SoundFile filemarge;
SoundFile filehihi;

Ball b;


int score;
int clvl=0;
int vie=5;
PImage heart;
PImage heart1;
PImage heart2;
PImage heart3;
PImage heart4;
PImage donut;
PImage homer;
PImage burns;
PImage duff;
PImage youwin;
PImage youloose;

boolean stopAgentPop = false;
int nbpoped = 0;
int nbeaten = 0;

ArrayList<Agent> bubbles = new ArrayList<Agent>();
ArrayList<Agentdouble> badguy = new ArrayList<Agentdouble>();
ArrayList<Level> niveau = new ArrayList<Level>();
ArrayList<ViePlus> oneup = new ArrayList<ViePlus>();
ArrayList<Malus> moins200 = new ArrayList<Malus>();

void setup() {

  fullScreen();
  noCursor();
  //size(800, 800);

  b = new Ball(width/2, height/2);
  
  //moins200.add(new Malus());
  niveau.add(new Level (50, 50, 10, 1, 5, 400, 5, 0, 1));
  niveau.add(new Level (50, 55, 10, 1, 10, 400, 5, 0, 1));
  niveau.add(new Level (60, 40, 15, 5, 15, 400, 10, 0, 1));
  niveau.add(new Level (60, 45, 20, 10, 20, 500, 10, 0, 1));
  niveau.add(new Level (70, 40, 25, 15, 25, 500, 10, 0, 1));
  niveau.add(new Level (70, 40, 30, 20, 29, 500, 15, 0, 1));
  niveau.add(new Level (80, 30, 35, 25, 33, 500, 15, 1, 1));
  niveau.add(new Level (80, 30, 40, 30, 37, 600, 15, 1, 2));
  niveau.add(new Level (90, 27, 45, 35, 41, 600, 20, 1, 2));
  niveau.add(new Level (90, 27, 50, 40, 43, 600, 20, 1, 2));
  niveau.add(new Level (100, 27, 55, 45, 47, 600, 20, 2, 2));
  niveau.add(new Level (100, 25, 60, 50, 50, 600, 20, 2, 2));
  niveau.add(new Level (110, 25, 65, 55, 53, 600, 25, 2, 2));
  niveau.add(new Level (110, 25, 65, 55, 56, 600, 25, 2, 2));
  niveau.add(new Level (120, 20, 70, 60, 59, 600, 25, 2, 3));
  niveau.add(new Level (130, 20, 70, 60, 61, 600, 25, 3, 3));
  niveau.add(new Level (130, 20, 75, 65, 63, 700, 30, 3, 3));
  niveau.add(new Level (140, 17, 75, 65, 65, 700, 30, 3, 3));
  niveau.add(new Level (140, 17, 80, 70, 67, 700, 35, 3, 4));
  niveau.add(new Level (150, 17, 80, 70, 69, 700, 35, 3, 4));
  niveau.add(new Level (150, 15, 85, 75, 71, 700, 35, 3, 4));
  niveau.add(new Level (150, 15, 85, 75, 75, 700, 35, 3, 4));
  
  for (int i = 0; i < 1; i++) {
    bubbles.add(new Agent(1000, 1000));
    nbpoped +=1;
  }
  
  filetheme = new SoundFile(this,"themsimp.mp3");
    filetheme.play();
    filetheme.amp(1);
    filetheme.loop();
    
  heart = loadImage("heart.png");
  heart1 = loadImage("heart copie.png");
  heart2 = loadImage("heart copie 2.png");
  heart3 = loadImage("heart copie 3.png");
  heart4 = loadImage("heart copie 4.png");
  donut = loadImage("donut.png");
  homer = loadImage("homer.png");
  burns = loadImage("burns-02.png");
  duff = loadImage("duff-03.png");
  youwin = loadImage("youwin.jpg");
  youloose = loadImage("youloose.jpg");
  fileburns = new SoundFile(this,"homouille.mp3");
  filevie = new SoundFile(this,"homyouhou.mp3");
  filemarge = new SoundFile(this, "margehm.mp3");
  filehihi = new SoundFile(this, "hihi.mp3");
}



void draw() {
  
  
  if (vie!=0 && nbeaten!=niveau.get(clvl).nb2pop){
  motionBlur(80);
  }
  println(nbeaten, niveau.get(clvl).nb2pop, clvl);
  textSize(32);
  fill(255);
  text(score, 10, 40);


  if (vie>=1){
      image(heart, width-50, 40, 42, 32);
  }

  if (vie>=2){
      image(heart1, width-80, 40, 42, 32);
  }

  if (vie>=3){
      image(heart2, width-110, 40, 42, 32);
  }

  if (vie>=4){
    image(heart3, width-140, 40, 42, 32);
  }

  if (vie>=5){
    image(heart4, width-170, 40, 42, 32);
  }


  b.update(mouseX, mouseY, 0.1);
  b.display();

  if (frameCount%niveau.get(clvl).popBlanc == 0 && nbpoped <=niveau.get(clvl).nb2pop){
    
    bubbles.add(new Agent(1000, 1000));  
    
    nbpoped+=1;
  }


  for (int i = 0; i<bubbles.size(); i++) {
    Agent a = bubbles.get(i);
    a.display();
    a.update();

    if (dist(b.xpos, b.ypos, a.xpos, a.ypos)<30  && vie!=0 && nbeaten!=niveau.get(clvl).nb2pop) {
      bubbles.remove(i);
      nbeaten+=1;
      score=score+100;
      
      filehihi.play();
      filehihi.amp(3);
      
    }
  }



  if (frameCount%niveau.get(clvl).popRouge == 0 && badguy.size()<niveau.get(clvl).nb2popRouge) {
    badguy.add(new Agentdouble(1000, 1000, niveau.get(clvl).speedxRouge, niveau.get(clvl).speedyRouge));
    /*En plus d'utiliser ma class pour déterminer la fréquence d'apparition de mes agents, je l'utilise pour déterminer la vitesse de déplacement,
    déterminée dans la class Agentdouble en suivant le même principe qu'avec popBlanc. 
    C'est à dire que je remplace mon speedx et speedy par une autre variable définie par la class Level. Ainsi, je peux choisir sa valeur à chaque
    création d'un nouveau niveau avec Level.*/
  }



  for (int j = 0; j<badguy.size(); j++) {
    Agentdouble e = badguy.get(j);
    e.display();
    e.update(15, 5);

    if (dist(b.xpos, b.ypos, e.xpos, e.ypos)<50  && vie!=0 && nbeaten!=niveau.get(clvl).nb2pop) {
      badguy.remove(j);
      score=score-100;
      
        fileburns.play();
        fileburns.amp(6);
        
      if (vie>b.vieMin){
      vie=vie-1;
      }
    }
  }
    
    if (frameCount%niveau.get(clvl).popViePlus == 0 && oneup.size()<1) {
    oneup.add(new ViePlus(1000, 1000));
    }
    
  for (int k = 0; k<oneup.size(); k++) {
    ViePlus l = oneup.get(k);
    l.display();
    l.update();

    if (dist(b.xpos, b.ypos, l.xpos, l.ypos)<50  && vie!=0) {
      oneup.remove(k);
      if (vie<b.vieMax){
      vie=vie+1;
      }
      textSize(15);
        fill(255);
        text("+up", l.xpos-30, l.ypos-30);
        
        filevie.play();
        filevie.amp(6);
    }
  }
    
    
  for (int o = 0; o<moins200.size(); o++) {
    Malus p = moins200.get(o);
    p.display();
    p.update();
    
    if (dist(b.xpos, b.ypos, p.xpos, p.ypos)<40 && vie!=0) {
         moins200.remove(o);
         score=score-200;
         textSize(15);
         fill(255);
         text("-2OO", p.xpos-30, p.ypos-30);
         filemarge.play();
         filemarge.amp(4);
         
    }
  }
  
  if (frameCount%70 == 0 && moins200.size()<niveau.get(clvl).nbpopMalus) {
    moins200.add(new Malus());
    }
  nextlvl();
  
}
