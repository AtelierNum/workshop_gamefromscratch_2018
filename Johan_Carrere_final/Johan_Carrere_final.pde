// JOHAN CARRERE
// GA2




//importation de la librairie Minim utilisée pour les sons
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//lancement du player Minim
AudioPlayer player;
Minim minim;

//importe la librairie de sons
import processing.sound.*; 
SoundFile file;

//Arraylist des "composants" du jeu
//Une Arraylist permet de ranger des variable dans une liste d'une taille spécifique
ArrayList<Bubbles> bub = new ArrayList<Bubbles>();
ArrayList<Bubbles2> bub2 = new ArrayList<Bubbles2>();
ArrayList<Flyer> fly = new ArrayList<Flyer>();
ArrayList<Violet> vio = new ArrayList<Violet>();
ArrayList<Level> level = new ArrayList<Level>();
ArrayList<Sniper> sni = new ArrayList<Sniper>();


int life = 3; // Vies disponibles
int currentlvl = 0; //Initialisation du niveau à 0
int scoreMax = 0; //Initialisation du score a obtenir pour passer le niveau à 0
int score; //Initialisation du score

Cercle catcher; //Initialisation du cercle qui suit le curseur

void setup () { //fonction setup() qui ne s'effectue qu'une seule fois au début lorsque le programme démarre

  noCursor(); //cache le curseur
  frameRate (60); //Initialise le taux d'image par seconde à 60
  fullScreen(); //programme en fullscreen
  //mode "fenêtré"
  // size(1920, 1000); //Créé un cadre (ici presque plein écran)
  minim = new Minim(this); //Initialisation du player Minim pour la lecture de sons
  player = minim.loadFile("Abstract.mp3"); //initialisation du son à lire
  player.loop(); //boucle pour mettre la musique en boucle

  catcher = new Cercle(0, 0); //Ajoute un élément "Cercle" (celui qui suit le curseur)

  //Niveaux de difficultés avec les paramétres des composant et des score a atteindre
  // construit de la manière suivante level.add(new Level(int fBlanc, int fRouge, int fViolet, int fSniper, int scoreMax));
  level.add(new Level(1, 2, 0, 0, 0));
  level.add(new Level(2, 3, 1, 1, 1));
  level.add(new Level(2, 5, 0, 0, 4));
  level.add(new Level(2, 5, 0, 0, 6));
  level.add(new Level(2, 5, 0, 0, 8));
  level.add(new Level(2, 5, 1, 0, 10));
  level.add(new Level(3, 6, 0, 0, 12));
  level.add(new Level(3, 7, 0, 0, 14));
  level.add(new Level(2, 8, 0, 0, 16));
  level.add(new Level(2, 8, 0, 0, 18));
  level.add(new Level(1, 8, 1, 0, 20));
  level.add(new Level(1, 9, 0, 0, 22));
  level.add(new Level(1, 10, 0, 0, 24));
  level.add(new Level(1, 10, 0, 0, 26));
  level.add(new Level(1, 10, 0, 0, 28));
  level.add(new Level(1, 10, 1, 0, 30));
  level.add(new Level(1, 12, 0, 0, 32));
  level.add(new Level(1, 12, 0, 0, 34));
  level.add(new Level(1, 13, 0, 0, 36));
  level.add(new Level(1, 14, 0, 0, 38));
  level.add(new Level(1, 15, 1, 0, 40));
}

void draw() {
  effa(120); //appel de la fonction effa qui permet l'effet "trainée" avec un paramètre(ici 80) pour la taille de la trainée
  println(player.position()); //indique dans la console la position du player
 // background(0); //créé un fond noir
  println(frameCount); //indique dans la console le nombre de frame depuis le lancement du jeu
  catcher.display(); //display du catcher
  catcher.update(mouseX, mouseY, 0.05); //update du catcher

  //Condition "if" permettant de ne faire apparaitre à l'écran qu'un nombre donné d'éléments (pour éviter un affichage infini)
  if (frameCount%level.get(currentlvl).fBlanc ==0 && bub.size()<level.get(currentlvl).fBlanc) {
    bub.add(new Bubbles(random(width), random(height)));
  }
  if (frameCount%level.get(currentlvl).fRouge ==0 && bub2.size()<level.get(currentlvl).fRouge) {
    bub2.add(new Bubbles2(random(width), random(height)));
  }
  if (frameCount%level.get(currentlvl).fRouge ==0 && vio.size()<level.get(currentlvl).fViolet) {
    vio.add(new Violet(random(width), random(height)));
  }
  if ( fly.size()<level.get(currentlvl).fFlyer + 1) {
    fly.add(new Flyer(random(width), random(height)));
  }
  if (sni.size()<level.get(currentlvl).fSniper + 1) {
    sni.add(new Sniper(random(width), random(height)));
  }

  //boucle for qui affiche l'élement de type "Bubbles"
  for (int i = 0; i < bub.size(); i++) {
    Bubbles b = bub.get(i);
    b.display();
    b.update();

    //condition "if" qui permet de supprimer l'ellipse lorsque le cercle curseur la touche
    if (dist(b.xpos, b.ypos, catcher.xpos, catcher.ypos)<25) {
      bub.remove (i); //supprime l'élément bub(i)  (Bubbles)
      file = new SoundFile(this, "Dum.wav"); //initialise le son "Dum.wav"
      file.play(); //joue le son initialisé avant
      file.amp(0.1); //baisse l'amplitude du son
      score = score +1; //l'élément ajoute un point de score
    }
  }

  //boucle for qui affiche l'élement de type "Bubbles2"
  for (int i = 0; i < bub2.size(); i++) {
    Bubbles2 c = bub2.get(i);
    c.display();
    c.update(1);
    if (dist(c.xpos, c.ypos, catcher.xpos, catcher.ypos)<38) {
      bub2.remove (i);
      score = score -2; //compteur de points
      life =life-1;
      file = new SoundFile(this, "Beam.wav");
      file.play();
      file.amp(0.1);
    
    }
  }

  //boucle for qui affiche l'élement de type "Flyer"
  for (int i = 0; i < fly.size(); i++) {
    Flyer d = fly.get(i);
    d.display();
    d.update(mouseX, mouseY, 0.002);
    if (dist(d.xpos, d.ypos, catcher.xpos, catcher.ypos)<25) {
      fly.remove (i);
      score = score -2; //compteur de points
      life =life-1;
      file = new SoundFile(this, "Beam.wav");
      file.play();
      file.amp(0.1);
    }
  }

  //boucle for qui affiche l'élement de type "Violet"
  for (int i = 0; i < vio.size(); i++) {
    Violet c = vio.get(i);
    c.display();
    c.update(1);
    if (dist(c.xpos, c.ypos, catcher.xpos, catcher.ypos)<25) {
      vio.remove (i);
      file = new SoundFile(this, "Dum.wav");
      file.play();
      file.amp(0.3);
      if (life<3) {
        life =life+1; //l'élément ajoute une vie
      }
    }
  }

  //boucle for qui affiche l'élement de type "Sniper"
  for (int i = 0; i < sni.size(); i++) {
    Sniper c = sni.get(i);
    c.display();
    c.update(1);
    if (dist(c.xpos, c.ypos, catcher.xpos, catcher.ypos)<35) {
      sni.remove (i);
      file = new SoundFile(this, "Dum.wav");
      file.play();
      file.amp(0.3);
      life =life-1;
      score = score-1;
    }
  }

  NextLevel();
  fill(255);
  textSize(14);
  //affiche le niveau
  text("Niveau ", width-80, 20);  
  text(currentlvl, width-20, 20);

  fill(255);
  textSize(14);
  //affiche le score
  text("Score", width-80, 40);
  text(score, width-20, 40);

  if (score>40) { //écran de victoire avec un score de +20
    noLoop();
    fill(255);
    rect(0, 0, width, height);
    fill(0);
    textSize(60);
    text("Gagné", width/2-120, height/2);
    textSize(26);
 text("Votre apaisement est peut-être la vraie victoire", width/2-120, height/2+50);
  }
  if (life<1) { //écran de défaite avec un score de -5
    noLoop();
    fill(0, 0, 0, 150);
    rect(0, 0, width, height);
    fill(255);
    textSize(60);
    text("Perdu ...", width/2-120, height/2);
    textSize(26);
 text("Votre score est " +score, width/2-120, height/2+100);

    player.pause();
    player = minim.loadFile("Twilight.mp3");
    player.loop();
  }
  //vies affichées avec des éléments en bas à droite (versions miniature du curseur)
  if (life >0) {
    noFill();
    stroke(random(100), random(100, 255), random(100, 255), 255);
    ellipse(width-20, height-20, random(10, 15), random(10, 15));
    stroke(random(100), random(100, 255), random(100, 255), 255);
    ellipse(width-20, height-20, random(10, 15), random(10, 15));
    stroke(random(100), random(100, 255), random(100, 255), 255);
    ellipse(width-20, height-20, random(10, 15), random(10, 15));
  }
  if (life >1) {
    noFill();
    stroke(random(100), random(100, 255), random(100, 255), 255);
    ellipse(width-40, height-20, random(10, 15), random(10, 15));
    stroke(random(100), random(100, 255), random(100, 255), 255);
    ellipse(width-40, height-20, random(10, 15), random(10, 15));
    stroke(random(100), random(100, 255), random(100, 255), 255);
    ellipse(width-40, height-20, random(10, 15), random(10, 15));
  }
  if (life >2) {
    //   noStroke();
    //   ellipse(width-60, height-20, 10, 10);  
    noFill();
    stroke(random(100), random(100, 255), random(100, 255), 255);
    ellipse(width-60, height-20, random(10, 15), random(10, 15));
    stroke(random(100), random(100, 255), random(100, 255), 255);
    ellipse(width-60, height-20, random(10, 15), random(10, 15));
    stroke(random(100), random(100, 255), random(100, 255), 255);
    ellipse(width-60, height-20, random(10, 15), random(10, 15));
  }

  //texte explicatif en bas à gauche
  fill(255);
  textSize(12);
  text("Le blanc est bon", 10, height-10);
  text("Le rouge est mauvais", 10, height-25);
    
}

void NextLevel() { //fonction qui change de niveau
  if (score>level.get(currentlvl).scoreMax && currentlvl<level.size()-1) {
    currentlvl=currentlvl+1;
  }
}

void effa(int a){
  fill(0, a); //remplissage en blanc(255) avec opacité a
  rect(-2,-2,width+2,height+2); //rectangle sur toute la taille du cadre avec les réglages d'opacité précédents
  //fonction "d'effacage" des cercles précédents. Poure laisser une trainée
}
