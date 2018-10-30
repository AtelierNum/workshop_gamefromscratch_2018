import processing.sound.*;//importation de la librairie permettant de mettre du son

SoundFile agent, speed, slow, grow, shrink, inverse, music, superMusic, GameOver;//création des variables qui stockeront le son
PImage coeur, circle, Lympho, fond;///images

Cercle[] Player = new Cercle[2];//objet de type "Cercle"
ArrayList<Agent> WVague = new ArrayList<Agent>();// tableau d'objets de type "Agent" blanc
ArrayList<Agent> RVague = new ArrayList<Agent>();//tableau d'objets de type "Agent" rouge
ArrayList<Agent> VVague = new ArrayList<Agent>();//tableau d'objets de type "Agent" vert/bonus vitesse
ArrayList<Agent> MVague = new ArrayList<Agent>();//tableau d'objets de type "Agent" violet/malus vitesse
ArrayList<Agent> Plus = new ArrayList<Agent>();//tableau d'objets de type "Agent" bleu "taille plus"
ArrayList<Agent> Moins = new ArrayList<Agent>();//tableau d'objets de type "Agent" orange "taille moins"
ArrayList<Agent> Invers = new ArrayList<Agent>();//tableau d'objets de type "Agent" orange "taille moins"
ArrayList<Agent> CoeurPlus = new ArrayList<Agent>();//etc
ArrayList<Agent> Super = new ArrayList<Agent>();
ArrayList<Level> lvl = new ArrayList<Level>();//tableau des niveaux
ArrayList<Coeur> coeurs1 = new ArrayList<Coeur>();//coeurs joueur 1
ArrayList<Coeur> coeurs2 = new ArrayList<Coeur>();//coeurs joueur 2

int currentLvl=0;//niveau actuel
int BlancEat=0;//nombre de blancs mangés
int t;//icrement dans le temps
boolean Win, Lose;//booléen si gagner ou si perdu

void setup() {
  fullScreen( P2D);
  pixelDensity(displayDensity());//adapte la densité de pixel à l'appareil
  for (int i=0; i<100; i++) {
    lvl.add(new Level(i*5, 10+i*10,40-int(i*0.35), 450-i*4,4+i*2, 1000-i*9,400+i*5, 800-i*7, 600+i*5, 800,900+i*5,10));//ajout d'un niveau
  }
  for (int i=0; i<3; i++) {//création de 3 coeurs pour chaques joueurs
    coeurs1.add(new Coeur());
    coeurs2.add(new Coeur());
  }
  //  textFont(typo);
  music = new SoundFile(this, "5Keer.mp3");//chargement des sons
  agent = new SoundFile(this, "agent.mp3");
  speed = new SoundFile(this, "speed.mp3");
  slow = new SoundFile(this, "slow.mp3");
  grow = new SoundFile(this, "grow.mp3");
  shrink = new SoundFile(this, "shrink.mp3");
  inverse = new SoundFile(this, "Inverse.mp3");
  superMusic = new SoundFile(this, "Super.wav");
  GameOver = new SoundFile(this, "GameOver.wav");
  coeur= loadImage("coeur.png");
  circle= loadImage("Virus.png");
  Lympho= loadImage("Lympho.png");
  fond = loadImage("Fond.png");

 // music = new SoundFile(this, "5Keer.mp3");
  music.loop();//music tourne en boucle dès le début du jeu
  
  Player[0]=new Cercle(300,300,1);//joueur 1
  Player[1]=new Cercle(width-300,height-300,2);//joueurs 2

}

void draw() {
  if (currentLvl==0) {
    Menu();//affichage menu
  } else {
    if(Lose || Win){//affichage Fin
    Ending();
    }else{
    Game(); //fonction comprenant le corps du jeu
    }
  }

//  println(keyCode);
}
