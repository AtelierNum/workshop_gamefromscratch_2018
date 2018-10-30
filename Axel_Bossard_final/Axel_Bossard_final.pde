import ddf.minim.*;

AudioPlayer player;
Minim minim;//audio context

//arraylist pour créer des objets
ArrayList<Agent> blanc = new ArrayList<Agent>();
ArrayList<Ennemis> rouge = new ArrayList<Ennemis>();
ArrayList<Level> lvl = new ArrayList<Level>();
ArrayList<Coeur> coeur = new ArrayList<Coeur>();
ArrayList<Vie> vie = new ArrayList<Vie>();
ArrayList<Bonus> bonus = new ArrayList<Bonus>();

Balle balle;

int freeze = 0;
int currentLevel = 1; //variable level 
int score = 0;  //variable score
int mangeblan = 1; //nombres de boules blanches mangées
float danger = 4; //accélérateur de rapidité boules rouges
int mangerou = 0; //nombre de boules rouges mangées

//==================================================================================================

void setup() {
  size(1000, 1000);
  blanc.add(new Agent());
  vie.add(new Vie());
  bonus.add(new Bonus());
  balle = new Balle(width/2, height/2);

//coeur en haut de l'écran positionnés grace à "image(heart,width/2-150 + (posh - 1)*100, height/22, 50, 50);"
  coeur.add(new Coeur(1));
  coeur.add(new Coeur(2));
  coeur.add(new Coeur(3));


  //MUSIC.........................................................

  minim = new Minim(this);
  player = minim.loadFile("ericstiff2.mp3", 2048);
  player.play();
  player.loop(); //permet de relancer la musique quand elle se termine

  //NIVEAUX DE DIFFICULTE.........................................................
  //fblanc flrouge vie bonus vitesse
  lvl.add(new Level(90, 140, 300, 700, 80));
  lvl.add(new Level(100, 120, 290, 700, 80));
  lvl.add(new Level(100, 100, 280, 700, 80));
  lvl.add(new Level(100, 80, 270, 700, 80));
  lvl.add(new Level(100, 75, 260, 600, 80));
  lvl.add(new Level(100, 65, 250, 500, 80));
  lvl.add(new Level(100, 60, 240, 400, 80));
  lvl.add(new Level(100, 55, 240, 300,80));
  lvl.add(new Level(100, 100, 240, 700, 80));
  lvl.add(new Level(100, 100, 240, 700, 80));
  lvl.add(new Level(100, 100, 240, 700, 80));
  lvl.add(new Level(100, 100, 240, 700, 80));

  //dernière "}" du setup
}
//==================================================================================================

void draw() {

  noCursor();

  //MOTIONBLUR.........................................................
  motionBlur(80, 0); //contrôle la transparence du background via le void motionBlur


  //POP AGENTS.........................................................
  if (frameCount%lvl.get(currentLevel) . fblanc==0) {  //apparition des allies
    blanc.add(new Agent());
  }
  if (frameCount%lvl.get(currentLevel) . frouge==0) {  //apparition des ennemis
    rouge.add(new Ennemis());
  }
  if (frameCount%lvl.get(currentLevel) . vie==0) {  //apparition des vies
    vie.add(new Vie());
  }
  if (frameCount%lvl.get(currentLevel) . fbonus==0) {  //apparition des vies
    bonus.add(new Bonus());
  }


  //CLASS BALLE.........................................................
  balle.update(mouseX, mouseY);  //ball suit la souris
  balle.display();


  //AGENT BLANC.........................................................
  for (int i = 0; i < blanc.size(); i ++) { //les agents
    Agent a = blanc.get(i);
    a.display();
    a.update(3*danger);
    if (dist(balle.x, balle.y, a.xpos, a.ypos)<50) { //manger les agents blanc
      blanc.remove(i);       
      score=score+1;        //augmente le score de +1
      mangeblan=mangeblan+1; //augmente le nombre d'agents blancs mangés

      minim = new Minim(this);
      player = minim.loadFile("win.mp3", 2048);
      player.play();
    }
  }


  //AGENT ROUGE.........................................................
  for (int i = 0; i < rouge.size(); i ++) { //les agents
    Ennemis a = rouge.get(i);
    a.display();
    a.update(danger);
    if (dist(balle.x, balle.y, a.xpos, a.ypos)<50) { //manger les agents rouge
      rouge.remove(i); 
      mangerou=mangerou+1; //compteur de boules rouges prend +1 (au bout de 3 boules rouges = game over)
      score=score-2;
      coeur.remove(coeur.size()-1);

      minim = new Minim(this);
      player = minim.loadFile("down.mp3", 2048);
      player.play();
    }
  }


  //AGENT VIE.........................................................
  for (int i = 0; i < vie.size(); i ++) { //les agents
    Vie a = vie.get(i);
    a.display();
    a.update(7*danger);
    if ((dist(balle.x, balle.y, a.xpos, a.ypos)<30)&mangerou>0) { //manger les agents vie
      coeur.add(new Coeur(4-mangerou)); //coeur initialisé à 0 (coeur fauche vers la droit = 0, 1, 2) donc 
      mangerou=mangerou-1;
      vie.remove(i);

      minim = new Minim(this);
      player = minim.loadFile("healthup.mp3", 2048);
      player.play();
    }
  }
  //AGENT BONUS.........................................................
  for (int i = 0; i < bonus.size(); i ++) { //les agents
    Bonus a = bonus.get(i);
    a.display();
    a.update(danger);
    if (dist(balle.x, balle.y, a.xpos, a.ypos)<50) { //manger les agents bonus
      bonus.remove(i); 
      freeze = frameCount;

      minim = new Minim(this);
      player = minim.loadFile("freezing.mp3", 2048);
      player.play();
    }
  }

  if ((frameCount < 180 + freeze)&(frameCount>180)) {
    if (frameCount==freeze){
    danger= danger/(currentLevel+1); //slow de plus en plus en fonction des level
    }
  } else {
    danger=4; //une fois 3 secondes passées après quela boule soit mangé, sensibilité des boules revient à la normale)
  }


  //SCORE.........................................................
  if (score>=0) {
    fill(255);
  } else {
    fill(#FFBB3B);
  }
  textSize(30);
  text("Score = "+score, 20, 50);



  //LEVEL.........................................................
  if (mangeblan>10) {
    currentLevel=currentLevel+1;
    mangeblan=1;
    mangerou=0;
  }


  //GAME OVER.........................................................
  if (mangerou>=3) {
    textSize(80);
    fill(255);
    text("YOU LOSE", width/2-230, height/2-50);
    minim = new Minim(this);
    player = minim.loadFile("youlose.mp3", 2048); //joue le son youlose
    player.play();
  }

  if (mangerou>=3) {
    noLoop();
  }


  //AFFICHAGE REJOUER.................................................
  if (mangerou>=3) {
    textSize(40);
    fill(#5EED00);
    text("PRESS UP TO PLAY AGAIN", width/2-245, height/2+100);
  }


//AFFICHAGE REJOUER.................................................
    textSize(20);
    fill(255);
    text("Axel BOSSARD GA2 2018-2019", width/2+130, height-50);
  
  
  //AFFICHAGE LEVEL.................................................
  fill(255);
  text("LVL : " + currentLevel, width-120, 50);


  //VIES.................................................
  for (int i = 0; i < coeur.size(); i ++) {
    Coeur part = coeur.get(i);
    part.display();
  }
  
    
  //VOUS AVEZ GAGNE.................................................
  if (currentLevel == 8){
    textSize(80);
    fill(255);
    text("YOU WIN", width/2-230, height/2-50);
    textSize(40);
    fill(#5EED00);
    text("PRESS UP TO PLAY AGAIN", width/2-245, height/2+100);
    minim = new Minim(this);
    player = minim.loadFile("youwin.mp3", 2048); //https://ericskiff.com/music/
    player.play();
    noLoop();
  }

  //dernière "}" du draw
}
//==================================================================================================

void motionBlur(int transparency, int backgr) {
  fill(backgr, transparency);
  rect(0, 0, width, height);
}

//==================================================================================================

//REJOUER
void keyPressed() {
  //remet la totalité de nos variables stockées à leur valeures d'origine
  score = 0;
  currentLevel = 1;
  mangeblan = 1;
  mangerou = 0;

  coeur.add(new Coeur(1));
  coeur.add(new Coeur(2));
  coeur.add(new Coeur(3));

//supprime les entités au moment où l'on relance la partie
  if (key == UP);
  loop();
  score=0;
  for (int i = 0; i < rouge.size(); i ++) {
    rouge.remove(i);
  }
  for (int i = 0; i < blanc.size(); i ++) {
    blanc.remove(i);
  }
}

//==================================================================================================

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}
