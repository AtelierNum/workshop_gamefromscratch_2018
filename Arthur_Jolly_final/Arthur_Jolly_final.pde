//Arthur Jolly 2018







/* vous incarnez la planete terre, c'est a vous de la repeupler. collecter un maximum de barack Obama et de vif d'or pour créé un monnde meilleur et gagner mais... faites attention au stormtrooper et 
au fiat multipla !!*/









// agent   a;




// les differents son du jeu 
import processing.sound.*;// son du stormtrooper:" cri de wilhelm"
SoundFile gg;
import processing.sound.*;// son du malus (fiat multipla)
SoundFile prout;
import processing.sound.*;// son de l'humain(b.Obama)
SoundFile woow;
import processing.sound.*;
SoundFile yes;
// image que l'on retrouve sur le bubble catch
PImage terra;
PImage barack;
PImage trooper;
PImage kappa;
PImage vifd;
PImage space;

ArrayList<Agent> bubbles = new ArrayList();
ArrayList<mechant> redshit = new ArrayList();
ArrayList<level> lvl = new ArrayList();
ArrayList<bonus> bobo = new ArrayList();
ArrayList<malus> mama = new ArrayList();
float x;
float y;
float a;
float b;
int clvl=0;




void setup() {
  // taille du terrain de jeu
  size(1024, 888);
  // emplacement des ficher images
  terra = loadImage("terra.png");
  barack = loadImage("barack.png");
  trooper = loadImage("trooper.png");
  kappa = loadImage("multi.png");
  vifd = loadImage ("vifd.png");
  space = loadImage ("space2.jpg");

  bubbles.add(new Agent(random(width), random(height)));
  redshit.add(new mechant(random(width), random(height)));
  lvl.add(new level(20, 20, 50 ));
  lvl.add(new level(20, 30, 75));
  lvl.add(new level(30, 45, 100 ));
  lvl.add(new level(50, 80, 150 ));
  lvl.add(new level(100, 140, 250));
  lvl.add(new level(150, 200, 400 ));
// emplacement des ficher son 
  gg = new SoundFile(this, "wilhelm.wav");
  prout = new SoundFile(this, "fart.wav");
  woow = new SoundFile(this, "woow.wav");
  yes = new SoundFile(this, "yes.wav");
}



void draw() {
  image(space,0,0);// arriere plan noir 
  fill(42, 88, 0);


// la terre se déplace
  x = lerp(x, mouseX, 0.1);// création du déplacement avec souri
  y = lerp(y, mouseY, 0.1);
  image(terra, x, y, 60, 60);

// spawn des differents objet sur le terrain a intervalle régulier 
  if (frameCount%25 ==0) {
    redshit.add(new mechant(random(width), random(height)));// spawn stormtrooper
  }
  if (frameCount%25 ==0) {
    bubbles.add(new Agent(random(width), random(height)));// spawn B.Obama
  }
  if (frameCount%100 ==0) {
    bobo.add(new bonus(random(width), random(height)));// spawn vif d'or
  }
  if (frameCount%200 ==0) {
    mama.add(new malus(random(width), random(height))); //spawn voiture
  }
  // affichage du score
  fill(255, 77, 77);
  textSize(50);
  text("score: " + score, 40, 70);

  for (int i = 0; i < bubbles.size(); i ++) {
    Agent a = bubbles.get(i);
    a.display();
    a.update();
    sup();
    enemie();
  }
  for (int i = 0; i < redshit.size(); i ++) {
    mechant b = redshit.get(i);
    b.display();
    b.update();
    sup();
    enemie();
  }
  for (int i = 0; i < bobo.size(); i ++) {
    bonus l = bobo.get(i);
    l.display();
    l.update();
    sup();
    enemie();
    nice();
  }
  for (int i = 0; i < mama.size(); i ++) {
    malus m = mama.get(i);
    m.display();
    m.update();
    sup();
    oops();
  }

// mis en place des level 
  newlevel ();
  fill(255, 150, 66);
  textSize(42);
  text("LEVEL:"+ clvl, (width -160), 40);

  // fill();
  //textSize (32)
}
void newlevel () {
  if (score>lvl.get(clvl).ScoreRequis && clvl<lvl.size ()-1) {
    clvl = clvl + 1;
  } // condition pour gagner
  if (score>lvl.get(clvl).ScoreRequis) {
    fill(255);
    textSize(82);
    text ("!YOU WIN!", 300, height/2);
    noLoop();
  } // condition pour perdre
  if (score<0) {
    fill(255, 0, 0);
    textSize (82);
    text("Game Over", 300, height/2);
    noLoop();
    // fin de jeu 
  }
}
