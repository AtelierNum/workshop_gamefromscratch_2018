
// Rémi Leprévost   14/09/2018 


int asS = 300000; // nombre limuite d asteroide
float pX = 0; // position de mon vaiseau en X
float pY = 0; // position de mon vaiseau en X
float latence = 0.1; 
int bar = 200; // valeur de ma bar d oxygen en X
int ox = 1; // frame de disparition de la barre d oxygen
int cWv = 0; // la vague en cours
float redB = 0; // nombre de boule vert
int greenB =0; // nombre de boule rouge
int timeNW ;
int timeB = 1150;
int WaveN1 =1;
int WaveN = 1;

AsteroM asM;
AsteroN asN;
AsteroG asG;
AsteroB asB;

BAstron bs;
Expl ex;
Barre ba;
Dest dt;
Wave wv;

ArrayList <AsteroM> asterosM = new ArrayList <AsteroM> ();
ArrayList <AsteroN> asterosN = new ArrayList <AsteroN> ();
ArrayList <AsteroG> asterosG = new ArrayList <AsteroG> ();
ArrayList <AsteroB> asterosB = new ArrayList <AsteroB> ();

ArrayList<Wave> waves = new ArrayList <Wave> () ;

ArrayList <Dest> dests = new ArrayList <Dest> ();
ArrayList <BOxy> boxys = new ArrayList <BOxy> ();
ArrayList <BAstron> astrons = new ArrayList <BAstron> ();
ArrayList <Expl> expls = new ArrayList <Expl> ();

import ddf.minim.*;
AudioPlayer player;
Minim minim;

void setup () {

  size (1500, 1000);

  noCursor();

  asterosM.add(new AsteroM()); // invoque un asteroid en debut de partie
  asterosN.add(new AsteroN());// invoque un asteroid en debut de partie
  asterosG.add(new AsteroG());// invoque un asteroid en debut de partie
  asterosB.add(new AsteroB());// invoque un asteroid en debut de partie

  waves.add(new Wave (20, 120, 60*12, 60+24, 60*2, 60*20, 60*15, 2, 5, 2, 1, 1));// definit tout les valeurs de span de chaque asteroid en fonction de la vague en crours
  waves.add(new Wave (20, 100, 60*11, 60*18, 60*2, 60*21, 60*14, 3, 5, 2, 2, 2)); 
  waves.add(new Wave (40, 50, 60*8, 60*15, 60*3, 60*22, 60*13, 4, 8, 2, 3, 3)); 
  waves.add(new Wave (80, 50, 60*6, 60*12, 60*4, 60*23, 60*12, 5, 10, 1, 4, 4)); 
  waves.add(new Wave (10, 20, 60, 60, 60*2 , 60*24, 60*11, 6, 10, 1, 5, 5)); 
  
  dt = new Dest();
  ba = new Barre(); // invoque ma barre d oxygen

  minim = new Minim(this); // permet de mettre mon son de background
  player = minim.loadFile("MusicF.mp3", 2048);
  player.play(); 
  player.loop(); // met mon son en boucle
}

//----------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------

void draw () {

  trace(80); // donne la transparence du rectangle qui efface les objet


  if (frameCount%8 == 0) {
    timeB = timeB+1;
  }
  if (timeB >= 1500 ) {
    timeB = timeB-350;
  }
  if (frameCount%2700 == 0) {
    WaveN1 = WaveN1+1;
    WaveN = WaveN+1;
  }

  pX = attract (mouseX, pX, latence); // donne les coordonnee du curseur par rapport a ma souris
  pY = attract (mouseY, pY, latence);

  if (frameCount%ox ==0) {
    bar=bar+1;
  }


  if (frameCount%waves.get(cWv).asteroFM ==0 && asterosM.size()<asS) { // cree un nombre d asteroid tout les frame donner par la valeurs de la vague actuelle
    asterosM.add(new AsteroM());
  }
  if (frameCount%waves.get(cWv).asteroFN ==0 && asterosN.size()<asS) { // cree un nombre d asteroid tout les frame donner par la valeurs de la vague actuelle
    asterosN.add(new AsteroN());
  }
  if (frameCount%waves.get(cWv).asteroFG ==0 && asterosG.size()<asS) { // cree un nombre d asteroid tout les frame donner par la valeurs de la vague actuelle
    asterosG.add(new AsteroG());
  }
  if (frameCount%waves.get(cWv).asteroFB ==0 && asterosB.size()<asS) { // cree un nombre d asteroid tout les frame donner par la valeurs de la vague actuelle
    asterosB.add(new AsteroB());
  }


  if (frameCount%waves.get(cWv).boxyF ==0 && boxys.size()<waves.get(cWv).boS) {
    boxys.add(new BOxy());
  }

  if (frameCount%waves.get(cWv).bastrF ==0 && astrons.size()<waves.get(cWv).baS) {
    astrons.add(new BAstron());
  }

  if (frameCount%waves.get(cWv).bexplF ==0 && expls.size()<waves.get(cWv).bexS) {
    expls.add(new Expl());
  }

  if (WaveN>waves.get(cWv).WaveN && cWv<waves.size()) {  
    timeNW++;
  } 

  if (WaveN >= 5) { // si les 5 vague sont terminer inisialise la victoire
    textSize (50);
    fill (255, 255, 255);
    text ("VICTORY", width/2-150, height/2); 
    noLoop();
  }

  //----------------------------------------------------------------------------------------------------------------------------------------------------------

  for (int i = 0; i<boxys.size(); i++) { // detecte quand une boule bleu est prise et la fait disparaitre pour redonner de l oxygen
    BOxy ba =boxys.get(i);
    ba.display ();
    if (dist(pX, pY, ba.posX, ba.posY)<25) {
      boxys.remove(i);
      bar = bar-200;
    }
  }
  for (int i = 0; i<astrons.size(); i++) { // detecte quand une boule vert est prise et la fait disparaitre 
    BAstron bs =astrons.get(i);
    bs.display ();
    if (dist(pX, pY, bs.posX, bs.posY)<25) {
      astrons.remove(i);
      greenB = greenB+1;
    }
  }
  for (int i = 0; i<expls.size(); i++) { // detecte quand une boule reouge est prise et la fait disparaitre
    Expl ex =expls.get(i);
    ex.display ();
    if (dist(pX, pY, ex.posX, ex.posY)<25) {
      expls.remove(i);
      redB =redB+1;
    }
  }

  //----------------------------------------------------------------------------------------------------------------------------------------------------------

  strokeWeight (2); // cree mon curseur
  stroke (255, 255, 255);
  fill(0, 0, 0, 0);
  quad (pX-20, pY-20, pX+40, pY+10, pX+20, pY+20, pX+10, pY+40);

  //----------------------------------------------------------------------------------------------------------------------------------------------------------

  for (int i = 0; i<asterosM.size(); i++) { // detecte quand un asteroid rendtre en collision et la fait disparaitre et fait predre de l oxygen
    AsteroM asM =asterosM.get(i);
    asM.update ();
    asM.display ();
    if (dist(pX, pY, asM.posX, asM.posY)<15) {
      asterosM.remove(i);
      bar = bar+200;
    }
    if ( redB > 0 ) {
      if (mousePressed == true ) {
        dt.display (mouseX, mouseY);
    
        if (dist(pX, pY, asM.posX, asM.posY)<500) {
          asterosM.remove(i);
           redB--;
        }
          
      }
    }
  }
  for (int i = 0; i<asterosN.size(); i++) { // detecte quand un asteroid rendtre en collision et la fait disparaitre et fait predre de l oxygen
    AsteroN asN =asterosN.get(i);
    asN.update ();
    asN.display ();
    if (dist(pX, pY, asN.posX, asN.posY)<40) {
      asterosN.remove(i);
      bar = bar+200;
    }
    if ( redB > 0 ) {
      if (mousePressed == true ) {
        dt.display (mouseX, mouseY);
        
        if (dist(pX, pY, asN.posX, asN.posY)<500) {
          asterosN.remove(i);
           redB--;
        }
        
      }
    }
  }
  for (int i = 0; i<asterosG.size(); i++) { // detecte quand un asteroid rendtre en collision et la fait disparaitre et fait predre de l oxygen
    AsteroG asG =asterosG.get(i);
    asG.update ();
    asG.display ();
    if (dist(pX, pY, asG.posX, asG.posY)<60) {
      asterosG.remove(i);
      bar = bar+200;
    }
    if ( redB > 0 ) {
      if (mousePressed == true ) {
        dt.display (mouseX, mouseY);
      
        if (dist(pX, pY, asG.posX, asG.posY)<500) {
          asterosG.remove(i);
           redB--;
        }
       
      }
    }
  }
  for (int i = 0; i<asterosB.size(); i++) { // detecte quand un asteroid rendtre en collision et la fait disparaitre et fait predre de l oxygen
    AsteroB asB =asterosB.get(i);
    asB.update ();
    asB.display ();
    if (dist(pX, pY, asB.posX, asB.posY)<120) {
      asterosB.remove(i);
      bar = bar+200;
    }
    if ( redB > 0 ) {
      if (mousePressed == true ) {
        dt.display (mouseX, mouseY);
         
        if (dist(pX, pY, asB.posX, asB.posY)<500) {
          asterosB.remove(i);
       redB--;
        }

       
      }
    }
  }

  //----------------------------------------------------------------------------------------------------------------------------------------------------------

  //println(greenB, redB);
  ba.display(bar, greenB, redB, timeB, WaveN);

  if (bar>1500) { // si ma barre d oxygen est vide , inisialise le game over
    textSize (50);
    fill (255, 255, 255);
    text ("GAME OVER", width/2-150, height/2); 
    noLoop();
  }
}

//----------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------

float attract (float position, float cible, float sensivility) { // calcule la latence du curseru vers ma souris
  return  (cible - position ) * sensivility + position;
}

//----------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------

void trace (int transp) { // definit le rectangle qui va effacer les trace des objet
  fill (0, transp); 
  rect (0, 0, width, height);
}

//----------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------
