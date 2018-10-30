          // Variables son
import processing.sound.*;
SoundFile fond ;
SoundFile lose ;
SoundFile wrong ; 
SoundFile good ;
SoundFile win ;
           //variables générales
PImage img3;
PImage img2;
PImage img;
boolean losehasplayed = false;
boolean winplayed = false;
int score = 0;
float coef = 0;
int nombreframe = 0;
int clvl = 0;
boolean fin = false;
boolean perdu = false;
int timer = 0;

             //ArrayLists d'objets et de classes
Cercle cercle = new Cercle();
ArrayList<Agent> bubbles = new ArrayList();
ArrayList<Point> pills = new ArrayList();
ArrayList<Level> lvl = new ArrayList();
ArrayList<Bonus> bonus = new ArrayList();



void setup() {
  size(1500, 1000);
           //son et images ajoutés
  img = loadImage("asteroid2.png");
  img2 = loadImage("capsule.png");
  img3 = loadImage("spaceship.gif");
  fond = new SoundFile(this, "alien son.wav");
  wrong = new SoundFile(this, "wrong.wav");
  good = new SoundFile(this, "good2.wav");
  lose = new SoundFile(this, "lose son.wav");
  win = new SoundFile(this, "win.wav");
  fond.loop();
             //niveaux ajoutés
  bubbles.add(new Agent());
  pills.add(new Point());
  lvl.add(new Level(40, 30, 300, 4, -100, 80));
  lvl.add(new Level(35, 25, 1000, 6, 200, 80 ));
  lvl.add(new Level(30, 15, 2000, 8, 800, 80));
  lvl.add(new Level(25, 10, 3000, 9, 1800, 80));
  lvl.add(new Level(25, 5, 4000, 10, 2800, 80));
  println(lvl.size());
  bonus.add(new Bonus());
  noCursor();
}



void draw() {
  fill(255);
             //Condition de score max / score MIn

  if (score < lvl.get(clvl).ScoreMin) {
    perdu = true;
  }
              // son quand on perd + text de défaite
  if (perdu) {
    if (lose.isPlaying()== false && losehasplayed == false) {
      lose.play(); 
      losehasplayed = true;
    }
    fill(#FF0318);
    textSize(200);
    text("YOU LOSE", 250, height/2); 
    textSize(90);
    text("Click to try Again", 350, 600);
   
  } else {
   
    
    if (score >= lvl.get(clvl).ScoreMax && clvl<lvl.size()-1) {
      clvl++;
      println(clvl+" - "+lvl.size());
    } else if (score >= lvl.get(clvl).ScoreMax) {
      fin = true;
    }

                // son quand on gagne + texte de victoire
    if (fin) {
      // noLoop();
      if (win.isPlaying()== false && winplayed == false) {
        win.play(); 
        winplayed = true;
      }
      fill(255);
      textSize(200);
      text("YOU WIN", 325, height/2);
    } else {

                   //ajout des agents en fonction de leur nombre 
      
      if (frameCount%lvl.get(clvl).fRouge ==0 && bubbles.size()<35) {
        bubbles.add(new Agent());
      }
      if (frameCount%lvl.get(clvl).fBlanc==0 && pills.size()<8) {
        pills.add(new Point());
      }
      if (frameCount%lvl.get(clvl).bonus==0 && bonus.size()<3) {
        bonus.add(new Bonus());
      }
      
          // APPEL DE FONCTIONS LIEES 
          
      trace(150); 
      cercle.display();
      cercle.update();
      eclater();


              // APPEL DE FONCTION PAR RAPPORT AU NOMBRE D OBJETS

      for (int i = 0; i < pills.size(); i++) {
        Point p = pills.get(i);
        p.display();
        p.update();
        //  p.wrapping();
      }

      for (int i = 0; i < bubbles.size(); i ++) {
        Agent a = bubbles.get(i);
        a.display();
        a.update(lvl.get(clvl).coef);
        //    a.wrapping();
      }
      for (int i = 0; i < bonus.size(); i++) {
        Bonus b = bonus.get(i);
        b.display();
        b.update(10);
        //b.wrapping();
      }

                 // AFFICHAGE SCORE  ET NIVEAU 

      fill(255);
      textSize(50);
      text("score =" +score, 100, 100);
      text("Niveau " +(clvl+1), 1200, 100);

      /*  nombreframe++;  //timer sans choper une bulle
       if (nombreframe > 600) {   //si ça dépasse 300
       nombreframe = 0;    //valeur réinitialisée
       score-=100;
       fill(#FF6105);
       text("Timer" +timer, 100,300);
     } */
     
    
     
    }
  }
}
                                       


 
   //REJOUER

void mousePressed(){                      //RECOMMENCER SI ON PERD OU GAGNE 
  
    if( fin){
      reset();
     }
     if(perdu){
      reset(); 
     }
     }


void reset() {                            //FONCTION POUR RECOMMENCER
 losehasplayed = false;
 winplayed = false;
 score = 0;
coef = 0;
 nombreframe = 0;
 clvl = 0;
 fin = false;
 perdu = false;
timer = 0;
  bubbles = new ArrayList(); 
   pills = new ArrayList();
   
    bonus = new ArrayList();
}
                                          // FONCTION TRAINEE POUR LE POINTEUR 
void trace (int a) {
  fill(3,1,15, a); 
  rect(0, 0, width, height);
}
