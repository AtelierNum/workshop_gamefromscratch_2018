import ddf.minim.*;

Minim minim;
AudioPlayer player;



ArrayList<Bonus> bonus = new ArrayList<Bonus>();
ArrayList<Balle> balles = new ArrayList<Balle>();
ArrayList<Ennemi> ennemis = new ArrayList<Ennemi>();
ArrayList<Malus> malus = new ArrayList<Malus>();
ArrayList<megaBonus> megabonus = new ArrayList<megaBonus>();
ArrayList<Level> lvl = new ArrayList<Level>();
Ballon balloon;


//_____________________________________________________________________________________________________________________________
void setup() { 
  
  size(1000, 1000, P2D);
  balles.add(new Balle(random(width), random(height), 0.5));
 // ennemis.add(new Ennemi(random(width), random(height), 0.5));
  lvl.add(new Level(60, 90, 300, 300, 10));
  lvl.add(new Level(50, 80, 400, 400, 10));
  lvl.add(new Level(50, 60, 200, 400, 10));
  lvl.add(new Level(80, 50, 300, 300, 10));
  lvl.add(new Level(60, 50, 700, 500, 10));
  lvl.add(new Level(60, 40, 400, 400, 10));
  lvl.add(new Level(60, 35, 800, 400, 10));
  lvl.add(new Level(100, 30, 500, 400, 11));
  lvl.add(new Level(100, 25, 1000, 500, 12));
  lvl.add(new Level(120, 20, 1000, 500, 13));
  lvl.add(new Level(150, 600, 1000, 500, 10));

  balloon = new Ballon(mouseX, mouseY);
  minim=new Minim(this);
  player = minim.loadFile("soundtrack.mp3", 2048);
 player.play();
 player.loop();
}
int score = 0;                   //compter le score
float prog = 1;                    //compter le nombre du bulles blanches prises
float lose = 0;                    //compter le nombre de bulles ennemies prises
int currentlevel = 0; 
float sensi = 0.2;
float danger=6;               // sert à régler la sensi des boules rouges
float bx=1;                   //stocker des coordonnées
float by=1;                   //stocker des coordonnées
float mgx=1;                    //stocker des coordonnées
float mgy=1;                     //   stocker des coordonnées
float L=0  ;                 //servira à stocker les framecount pour l'affichage LEVEL UP
float B=0;              //timer pour l'affichage +1pt des boules blanches
float life=4;
float R=0;                  //timer pour l'affichage des -3pts des boules rouges
float rx=1;                   //stocker des coordonnées
float ry=1;                   //stocker des coordonnées
float levelLength=10;
float Bn=0;
float bnx=0;
float bny=0;
float Mn=0;
float mnx=0;
float mny=0;
//________________________________________________________________________________________________________________________________

void draw() {      
  fill(15, 10, 0, 130);                              //"Motionblur'
  // PImage img;
  // img=loadImage("paper2.jpg");
  // image(img,0,0);

  rect(0, 0, width, height);  
if (currentlevel==0){                         // écran d'accueil, descrfiption des bonus
      fill(0, 200, 20);
    textSize(40);
    text("        S t a r t    g a m e", width/2-300, height*3/4);
    fill(#09D69A);
    text("     Save     The     Earth", width/2-300, height*1/5);
    stroke(190);
      fill(random(200),100,random(250),80);
    rect(width/2-330,height*3/4-40,600,50);
  noStroke();
      fill(250, 250, 0);
    ellipse(100, height/2-150, 30, 30);
    textSize(25);
    text("La poubelle jaune c'est bien pour recycler, SPEED UP tiens",120,height/2-145);     //petites explications
        fill(20, 20, 240);
    ellipse(100, height/2-50, 30, 30);
    text("La poubelle bleue ça recycle quoi ? Hein ? bah SPEED DOWN",120,height/2-45);
        strokeWeight(15);
    stroke(200,200,100);
    fill(#03FCC0,random(30,70));
   ellipse(100,height/2+80,85,85);
   fill(200,200,100);
    text("En un clic, une méthode étrange pour détruire les déchets...",155,height/2+80);
    noStroke();
    strokeWeight(1);
  
 if ((mousePressed==true)&(width/2-230<mouseX)&(mouseX<width/2+270)&(height*3/4-40<mouseY)&(mouseY<height*3/4+10)) {
  currentlevel=1;                                     //passer au level 1 en cliquant
 }
} else {
  if (currentlevel==10) {                //condition de victoire
    cursor();
    textSize(80);
    fill(random(200), 250, random(200));
    text("YOU WON", width/2-200, height/2);
    fill(0, 200, 20);
    textSize(40);
    text("        P l a y   a g a i n", width/2-300, height*3/4);
    stroke(190);
      fill(random(200),100,random(250),80);
    rect(width/2-330,height*3/4-40,600,50);
  noStroke();
    fill(150,100,150,random(250));
    textSize(30);
    text("WHOoouuuaAH",width-300,height - 50);
    if ((mousePressed==true)&(width/2-230<mouseX)&(mouseX<width/2+270)&(height*3/4-40<mouseY)&(mouseY<height*3/4+10)) {                 //cliquer pour relancer une partie
      lose=0;
      score=0;
      currentlevel=1;
      prog=1;
      sensi=0.2;
    }
    for (int i=0; i<ennemis.size(); i++) {          //retirer les agents de la partie précédente
      ennemis.remove(i);
    }
    for (int i=0; i<balles.size(); i++) {
      balles.remove(i);
    }
    for (int i=0; i<bonus.size(); i++) {
      bonus.remove(i);
    }
    for (int i=0; i<malus.size(); i++) {
      malus.remove(i);
    }
  
} else if (lose<=4) {                          //tant qu'on a pas paerdu plus de 4 points de vie
  noCursor();
  balloon.update(mouseX, mouseY, sensi);
balloon.display();
  if (frameCount%lvl.get(currentlevel).popBlanc==0) {                                 //fréquence de "pop" des bulles à prendre
    balles.add(new Balle(random(width), random(height), random(0.05)));
  }


  for (int i=0; i<balles.size(); i++) {
    Balle part = balles.get(i);
    part.update();
    part.display();
    if (dist(balloon.x, balloon.y, part.x, part.y)<45) {       //collision avec le curseur
      balles.remove(i);
      score=score+1;
      prog=prog+1;
      B=frameCount;                            //stockage du timer et des coordonnées
      bx=balloon.x;
      by=balloon.y;
      minim=new Minim(this);
      player = minim.loadFile("plop.mp3", 2048);               //son des boulettes
      player.play();
    }
  }

  if ((frameCount>B+10)&(frameCount<B+40)) {              //afficher +1pt
    fill(250, 250, 250);
    text("+1", bx, by);
  }
  if ((frameCount%lvl.get(currentlevel).popBonus==0)&(ennemis.size()>1)) {                                // fréquence de "pop" des bonus
    bonus.add(new Bonus(random(width), random(height), random(0.05)));
  }
  for (int i=0; i<bonus.size(); i++) {
    Bonus part = bonus.get(i); 
    part.update();
    part.display();
    if (dist(balloon.x, balloon.y, part.x, part.y)<45) {           //en cas de collision avec le curseur
      bonus.remove(i);
      if (malus.size()>4) {
        malus.remove(malus.size()-1);
      }
      if (ennemis.size()>1){
      ennemis.remove(ennemis.size()-1);
      }
      if (sensi<1) {
        sensi=sensi*1.2;
      }
      Bn=frameCount;                         //stockage du timer et des coordonnées
      bnx=balloon.x;
      bny=balloon.y;
      minim=new Minim(this);                            // Son des bonus
      player = minim.loadFile("plip.mp3", 2048);
      player.play();
      // aide = aide++;
    }
  }
  if ((frameCount>Bn+20)&(frameCount<Bn+50)) {            //affichage des "SPEED UP"
    fill(250, 250, 10);
    text("Speed up", bnx, bny);
  }
  if (frameCount%lvl.get(currentlevel).popRouge==0) {                                     // fréquence de "pop" des bulles ennemies
    ennemis.add(new Ennemi(random(width), random(height), random(0.05)));
  }
  for (int i=0; i<ennemis.size(); i++) {
    Ennemi part = ennemis.get(i); 
    part.update(danger*3);
    part.display();
    if (dist(balloon.x, balloon.y, part.x, part.y)<45) {                 // si collision avec curseur
      ennemis.remove(i);
      score=score-2;
      lose=lose+1;                     //décompte des erreurs permises
      danger=danger+0.5;
      rect(0, 0, width, height);           //flash rouge à l'écran
      R=frameCount;                           //stockage du timer et des coordonnées
      rx=balloon.x;
      ry=balloon.y;
      minim=new Minim(this);                        //son des boules rouges
      player = minim.loadFile("ploup.mp3", 2048);
      player.play();
    }
    if (dist(mgx, mgy, part.x, part.y)<75) {
      ennemis.remove(int(random(ennemis.size())));
    }
  }
  if ((frameCount>R+10)&(frameCount<R+40)) {            //affichage des -3pts
    fill(250, 50, 50);
    text("-2", rx, ry);
  }

  if (frameCount%lvl.get(currentlevel).popMalus==0) {                                     // fréquence de "pop" des malus
    malus.add(new Malus(random(width), random(height), random(0.05)));
  }
  for (int i=0; i<malus.size(); i++) {
    Malus part = malus.get(i); 
    part.update();
    part.display();
    if (dist(balloon.x, balloon.y, part.x, part.y)<45) {                 // si collision avec curseur
      malus.remove(i);
      if (sensi<1.2) {                         //modificateur de sensi
        sensi=sensi/1.8;
      }
      danger=danger+2;
      Mn=frameCount;                 //stockage du timer et des coordonnées
      mnx=balloon.x;
      mny=balloon.y;
      fill(0, 0, 100);
      rect(0, 0, width, height);
      minim=new Minim(this);                      //son des malus
      player = minim.loadFile("plip.mp3", 2048);
      player.play();
    }
    if (dist(mgx, mgy, part.x, part.y)<75) {
      malus.remove(int(random(i)));
    }
  }
  if ((frameCount>Mn+20)&(frameCount<Mn+50)) {            //affichage des Speed down
    fill(20, 20, 250);
    text("Speed down", mnx, mny);
  }

  //if((prog>5)&(prog<levelLength-2)){

  /*for (int i=0; i<megabonus.size(); i++) {
    megaBonus p = megabonus.get(i); 
    p.update();
    p.display();
    mgx=p.x;
    mgy=p.y;
  } 
  }else {
    mgx=0;
    mgy=0;
  }
  */
 
  for (int i=0; i<megabonus.size(); i++) {         //affichage des megabonus
    megaBonus p = megabonus.get(i); 
    p.update();
    p.display();
    mgx=p.x;
    mgy=p.y;
  } 
    


  if (prog%lvl.get(currentlevel).levelLength==0) {                                    // LEVEL UP
    if (sensi<1) {
      sensi=sensi*1.1;
    }
    fill(0, 0, 255);
    rect(width/2-100, 40, 150, 20);
    L=frameCount;                                       //stockage du timer
    fill(100, 130, 0);
    // rect(0, 0, width, height);
    for (int i=0; i<megabonus.size(); i++) {             //supprimer des objets
      megabonus.remove(i);
    }
    for (int i=1; i<ennemis.size(); i++) {
      ennemis.remove(i);
    }

    megabonus.add(new megaBonus(random(100,width-100),random(100,height-100), 0.5));                //apparition megabonus
    //apparition d'un mega bonus
    prog=1;
    currentlevel=currentlevel+1;        
    if (lose>0) {
      lose=lose-1;            //récupérer une vie
    }     //    size(width+50,height+50);
  }
  if (frameCount<L+60) {
    fill(190, random(120),random( 120),150);
    textSize(60);
    text("LEVEL UP", width/2-200, height/2-50);
  }
} else {                 // cas où plus de 4 boules rouges on été mangées  DEFAITE
cursor();
  textSize(80);
  fill(250, random(200), random(200));
  text("WORLD OVER", width/2-280, height/2);        //message de défaite
  fill(0, 200, 20);
  textSize(40);
  stroke(190);
    text("        P l a y   a g a i n", width/2-300, height*3/4);
        fill(random(200),100,random(250),80);
    rect(width/2-330,height*3/4-40,600,50);
  noStroke();
  textSize(20);
    fill(150,100,150,random(250));
  text("big big noob :-D", width-250,height/4);                       //petite moquerie  
if ((mousePressed==true)&(width/2-230<mouseX)&(mouseX<width/2+270)&(height*3/4-40<mouseY)&(mouseY<height*3/4+10)) {       //cliquer pour rejouer
    lose=0;                   //réinitialisation des paramètres
    score=0;
    currentlevel=1;
    danger=6;
    prog=1;
    sensi=0.2;             
  }
  for (int i=0; i<ennemis.size(); i++) {
    ennemis.remove(i);
  }
  for (int i=0; i<balles.size(); i++) {
    balles.remove(i);
  }
  for (int i=0; i<bonus.size(); i++) {
    bonus.remove(i);
  }
  for (int i=0; i<malus.size(); i++) {
    malus.remove(i);
  }
}



//                                 VIES
//for(float i=1;i<=4;i++){

//}



fill(250, 250, 250, 180);
textSize(32);
text("Score : "+score, width-200, 50);
fill(150, 150, 255, 180);
text("LVL "+currentlevel, 50, 50);
life=lose;
fill(250, 0, 0, 170);
strokeWeight(1);
rect(width/2-75, 40, 30*(5-life), 20);                    //barre de vie

stroke(60);
fill(250, 0, 0, 60);
rect(width/2-75, 40, 150, 20);                                //barre de vie(fond)
fill(0, 50, 250, 50);
rect(50, 150, 20, 250);                   //barre de progression(fond)
fill(250, 250, 0, 50);
rect(width/2-250, height-20, 500, 5);          //barre de sensi
noStroke();
fill(0, 50, 250);
rect(50, 150, 20, 250/(lvl.get(currentlevel).levelLength)*(prog-1));            //barre de progression du niveau

fill(250, 250, 150, 200);
ellipse(width/2-250+(500/1.2)*sensi, height-18, 10, 20);         //indicateur de sensi
text("Speed",width/2-350,height-10);
}
}

void stop() {
  minim.stop();
  super.stop();
}
