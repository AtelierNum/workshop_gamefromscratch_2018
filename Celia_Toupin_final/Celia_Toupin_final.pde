//Importer le son de la librairie
import processing.sound.*;
SoundFile bulleblanche;
import processing.sound.*;
SoundFile bullerouge;
import processing.sound.*;
SoundFile sonfond;

//Importer des images
PImage eau ;
PImage javel ;
PImage gameover ;
PImage landscape ;
PImage guy ;
PImage youwinok;
PImage potionvie;


ArrayList<Agent>bubbles = new ArrayList() ;
ArrayList<Ennemi>wrongbubbles = new ArrayList () ;
ArrayList<Level>levels = new ArrayList () ;
ArrayList<Viesup>up = new ArrayList () ;
int currentlvl=0;
float x ;
float y ;
int a ;
int b ;
int vie=+3;
float vieMax=4 ;
float vieMin=0 ;
float score = 0;


void setup () {
  size (800, 800) ;  
  noCursor(); //enlever le curseur dans la fenêtre du jeu
  imageMode(CENTER);

  bubbles.add(new Agent(random (width), random (height))); // faire pop des bulles clean
  //a = new Agent () ;
  wrongbubbles.add(new Ennemi(random(width), random (height))); // faire pop des bulles ennemies
  //b = new Ennemi () ;
  up.add(new Viesup(random(width), random (height))); // faire pop des bulles 1up
  //c = new 1up () ;


  //20 niveaux - évolution des paramètres de chaque niveau
  levels.add(new Level (30, 60, 150));
  levels.add(new Level (30, 100, 300));
  levels.add(new Level (20, 120, 400));
  levels.add(new Level (20, 125, 500));
  levels.add(new Level (20, 120, 600));
  levels.add(new Level (20, 115, 700));
  levels.add(new Level (20, 110, 800));
  levels.add(new Level (20, 100, 900));
  levels.add(new Level (20, 90, 950));
  levels.add(new Level (20, 80, 1000));
  levels.add(new Level (20, 70, 1050));
  levels.add(new Level (20, 65, 1100));
  levels.add(new Level (20, 60, 1150));
  levels.add(new Level (20, 55, 1200));
  levels.add(new Level (20, 50, 1250));
  levels.add(new Level (20, 45, 1300));
  levels.add(new Level (20, 40, 1350));
  levels.add(new Level (20, 35, 1400));
  levels.add(new Level (20, 30, 1450));
  levels.add(new Level (20, 25, 1500));
  levels.add(new Level (20, 20, 1550));



  // Son 
  bulleblanche = new SoundFile(this, "boule blanche.wav");
  bullerouge = new SoundFile(this, "boulerouge.wav");
  sonfond = new SoundFile(this, "sonfond.wav");
  eau = loadImage("eau.png");
  javel = loadImage("javel.png");
  gameover = loadImage("gameover.gif");
  landscape = loadImage("landscape.png");
  guy = loadImage("guy.png");
  youwinok = loadImage("youwinok.jpg");
  potionvie = loadImage("potionvie.gif");

  //son de fond
  sonfond.play() ;
}


void draw() {
  background (landscape);



  if (frameCount%levels.get(currentlvl).a ==0) { // bulles qui apparaissent selon les niveaux
    bubbles.add(new Agent (random (width), random (height)));
  }
  if (frameCount%levels.get(currentlvl).b ==0) {
    wrongbubbles.add(new Ennemi (random (width), random (height)));
  }



  for (int i = 0; i<bubbles.size(); i ++) { //nb de bulles clean (i) +paramètres
    Agent a = bubbles.get(i) ;
    a.update();
    a.display();

    if (dist (a.xpos, a.ypos, x, y) <= 40) { //condition si les bulles croisent le curseur

      bubbles.remove(i) ; // conséquences (bulles qui disparaissent)
      score = score +15 ;
      bulleblanche.play();
    }
  }

  for (int j = 0; j<wrongbubbles.size(); j ++) { //nb bulles ennemies (j) +paramètres
    Ennemi b = wrongbubbles.get(j) ;
    b.update();
    b.display();

    if (dist (b.xpos, b.ypos, x, y) <= 40) { 

      wrongbubbles.remove(j) ;
      score = score - 20;
      vie=vie-1;    
      bullerouge.play();
    }
  }



  x = lerp (x, mouseX, 0.1) ; // retard curseur-xpos/ypos
  y = lerp (y, mouseY, 0.1) ;

  image(guy, x, y, 230, 230) ;


  //apparence vie en bas à droite de l'écran   
  if (vie >0) {
    image(guy, width-150, height-150, 180, 180);
  }
  if (vie >1) {
    image(guy, width-250, height-150, 180, 180);
  }
  if (vie >2) {
    image(guy, width-350, height-150, 180, 180);
  }
  if (vie >3) {
    image(guy, width-450, height-150, 180, 180);
  }
  if (vie >4) {
    image(guy, width-550, height-150, 180, 180);
  }



  if (score>600) { //Obtenir une vie - atteindre le niveau 5 (600pts)
    for (int g = 0; g<up.size(); g ++) { //nb bulles vie (g) +paramètres
      Viesup c = up.get(g) ;
      c.update();
      c.display();

      if (dist (c.xpos, c.ypos, x, y) <= 50) { 

        up.remove(g) ;
        vie=vie+1;  
        image(potionvie, 50, 50);
      }
    }
  }

  NextLevel () ;

  fill (0) ;
  textSize (32) ;
  text ("Niveau :"+currentlvl, (width -160), 40) ; 

  fill (0) ;
  textSize (32);
  text (score, 10, 40) ; //affichage du score
}



void NextLevel () { //Paramètres passage de niveau
  if (score>levels.get(currentlvl).ScoreRequis && currentlvl<levels.size ()-1) { //passage de niveau
    currentlvl=currentlvl+1 ;
  } else if (score>levels.get(currentlvl).ScoreRequis) { // Si on a passé tous les niveaux
    image (youwinok, 180, 200) ;
    noLoop () ; //arrêt du jeu
  }


  if (vie==0) { //s'il n'y plus de vie
    noLoop () ; 
    image(gameover, 180, 200);
  }
}
