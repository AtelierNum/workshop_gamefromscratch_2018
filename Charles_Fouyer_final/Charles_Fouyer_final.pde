
//Balle balle1;// création de la variable balle1
Balle balle= new Balle(width/2, height/2);// 
ArrayList<Agent> bubbles = new ArrayList<Agent>(); // creation Tableau ArrayList de la classe Agent
ArrayList<Ennemis> Badbubbles = new ArrayList<Ennemis>();//creation Tableau ArrayList de la classe Ennemis
ArrayList<Ennemis2> Badbubbles2= new ArrayList<Ennemis2>();// creation Tableau ArrayList de la classe Ennemis2
int Score=0;// initiation de la variable Score
ArrayList<Niveaux> niveaux = new ArrayList<Niveaux>();// creation Tableau ArrayList de la classe Niveaux
//float d= dist(  mouseX, mouseY, xpos, ypos); 
int currentlvl = 0; // initiation variable currentlvl
import ddf.minim.*;
AudioPlayer player;
Minim minim; 
PImage Curseur; // creation de la variable  Curseur (image)
PImage BadNuage;//creation de la variable BadNuage (image)
PImage ArcEnCiel;//creation de la variable ArcEnCiel
PImage Eclair;// creation de la variable Eclair



void setup() { 
  //background();
  fullScreen();// remplace size()
  noCursor();// ne pas afficher le pointeur de la souris
  //balle1= new Balle (50, 50); // initialisation de l'objet Balle
  //for (int i=0 ; i<100 ; i++){ 
  //balle.add(new Balle(random(width),random(height)));
  bubbles.add(new Agent()); // ajout instance de la classe Agent
  Badbubbles.add(new Ennemis());// ajout instance de la classe Ennemis
  Badbubbles2.add(new Ennemis2());//ajout instance de la classe Ennemis2
  niveaux.add(new Niveaux( 110, 85, 2000, 3, 5, 0, 100)); // ajout d'un niveau avec ses caracteristiques propres
  niveaux.add(new Niveaux( 110, 85, 2000, 3, 8, 0, 200));// ajout d'un niveau avec ses caracteristiques propres
  niveaux.add(new Niveaux( 110, 80, 2000, 3, 10, 5, 300));// ajout d'un niveau avec ses caracteristiques propres
  niveaux.add(new Niveaux( 110, 70, 2000, 3, 12, 10, 400));// ajout d'un niveau avec ses caracteristiques propres
  niveaux.add(new Niveaux( 110, 65, 2000, 3, 15, 15, 500));// ajout d'un niveau avec ses caracteristiques propres
  niveaux.add(new Niveaux( 110, 60, 2000, 3, 17, 20, 800));// ajout d'un niveau avec ses caracteristiques propres
  niveaux.add(new Niveaux( 110, 60, 1500, 3, 20, 50, 1000));// ajout d'un niveau avec ses caracteristiques propres
  niveaux.add(new Niveaux( 110, 60, 1000, 3, 20, 60, 2000));// ajout d'un niveau avec ses caracteristiques propres
  Curseur= loadImage("Licornepng.png"); // Variable Curseur correspond au chargement de l'image de Licornepng
  BadNuage= loadImage("Nuagegrispng.png"); // Variable BadNuage correspond au chargement de l'image de Nuagegrispng
  ArcEnCiel= loadImage("arcenciel2.0.png");// "
  Eclair= loadImage("Eclairpng.png");// "

  imageMode(CENTER);// initie l'image au centre des coordonnées et non en haut a gauche 
  minim=new Minim(this);// 
  player=minim.loadFile("son du jeu.mp3", 2048);// definition du son en continue dans le jeu
  player.play();
  loop();
  textAlign(CENTER);
}



void draw() { 



  trace (80);// trainée balle 
  balle.update(mouseX, mouseY, 0.1); // correspond a la Latence entre ma souris et mon curseur 
  balle.display(Curseur); // caracteristique de la balle definie dans la classe

  if (frameCount%niveaux.get(currentlvl).FBubbles==0) { // fréquence d'apparition de bubbles de la classe Agent par un nombre de Frame donné celon le niveau atteint
    bubbles.add(new Agent ()); // ajout d'une bubble de la classe Agent celon condition du dessus
  }
  if (frameCount%niveaux.get(currentlvl).FBadBubbles==0) { //fréquence d'apparition de BadBubbles de la classe Ennemis par un nombre de Frame donné celon le niveau atteint
    Badbubbles.add(new Ennemis ());// ajout d'une BadBubble de la classe Ennemis celon condition du dessus
  }

  if (frameCount%niveaux.get(currentlvl).FBadBubbles2==0) { //fréquence d'apparition de BadBubbles2 de la classe Ennemis2 par un nombre de Frame donné celon le niveau atteint
    Badbubbles2.add(new Ennemis2 ());// ajout d'une BadBulles de la classe Ennemis2 celon condition du dessus
  }



  for (int i=0; i< bubbles.size(); i++) { //boucle for qui ajoute des bubble tant que le tableau ArrayList n'est pas complet. 
    Agent a = bubbles.get(i);
    a.display(ArcEnCiel); // caracteristique bubbles notamment l'image donné.
    a.update(niveaux.get(currentlvl).VitBubbles);// position et vitesse de deplacement des bubbles
    a.wrapping(); // la fonction wrappin de la classe agent s'applique lorsque les bubbles sorte de l'ecran pour revenir de lautre côté.
    if ( dist(balle.x, balle.y, a.xpos, a.ypos )<50 ) { // si la distance entre la balle et une bubbles est inferieur a 50pixel .
      bubbles.remove(i); // La bulle disparait
      minim=new Minim(this);
      player=minim.loadFile("Bonus.mp3", 2048); //chargement du son Good1.mp3 lorsque que l'arc en ciel disparait.
      player.play();
      Score= Score+100;// le score augmente de 100 points Lorsque bubbles disparait
    }
  }

  for (int i=0; i< Badbubbles.size(); i++) { //boucle for qui ajoute des bubble tant que le tableau ArrayList n'est pas complet. 
    Ennemis b = Badbubbles.get(i);
    b.display(BadNuage); // caracteristique Badbubbles
    b.update(niveaux.get(currentlvl).VitBadbubbles);// position et vitesse de deplacement des bubbles
    b.wrapping(); // la fonction wrappin de la classe agent s'applique donc les Badbubbles sorte de l'ecran pour revenir de lautre côté.
    if ( dist(balle.x, balle.y, b.xpos2, b.ypos2 )<50 ) { // si la distance entre la balle et une bubbles est inferieur a 50pixel alors la bubble disparait.
      Badbubbles.remove(i); // Badbubbles disparait
      minim=new Minim(this);
      player=minim.loadFile("souffle cheval badbulles.mp3", 2048); //Chargement du son 
      player.play();
      Score= Score-100; // le score baisse de 100 points
    }
  }
  for (int i=0; i< Badbubbles2.size(); i++) { //boucle for qui ajoute des bubble tant que le tableau ArrayList n'est pas complet. 
    Ennemis2 b2 = Badbubbles2.get(i);
    b2.display(Eclair); // caracteristique image
    b2.update(niveaux.get(currentlvl).VitBadbubbles2);// position et deplacement des bubbles
    b2.wrapping(); // la fonction wrappin de la classe agent s'applique donc les Badbulles2 sorte de l'ecran pour revenir de lautre côté.
    if ( dist(balle.x, balle.y, b2.xpos3, b2.ypos3 )<50 ) { // si la distance entre la balle et une bubbles est inferieur a 50pixel alors la bubble disparait.
      Badbubbles2.remove(i);// ""
      minim=new Minim(this);
      player=minim.loadFile("Souffle2.mp3", 2048);//""
      player.play();
      Score= Score - 10000;//""
    }
  }


  if (Score>niveaux.get(currentlvl).ScoreMax) { // condition que si le score du niveaux atteint le maximum de point de ce meme niveau alors on passe au niveau suivant
    currentlvl ++; // passage au niveau suivant
  }


  if (Score<0) { // si le score est inferieur a 0 ( j'ouvr eune boucle si lorsqu'il y a une condition vrai / faux)
    fill(255); // fonction couleur de l'ecriture
    textSize(200); // taille du texte
    text("GAME OVER", width/2, height/2 -100);// Qu'est ce qu'on ecrit et ou sur l'ecran
    minim=new Minim(this);
    player=minim.loadFile("Son Perdu.mp3", 2048); // chargement du son lorsque le GAME OVER s'affiche
    player.play();
    noLoop(); // Arret du jeu et de l'image lorsque cela s'affiche grace a la fonction noLoop
  }

  if (Score>2000) { // Meme principe que la boucle "si" d'au dessus mais ici pour la victoire avec des score different un son different.
    fill(255);
    textSize(200);
    text("YOU WIN", width/2, height/2 -100);
    minim=new Minim(this);
    player=minim.loadFile("Win.mp3", 2048);
    player.play();
    noLoop();
  }

  if (Score<0) {
    fill(255); 
    textSize(200); 
    text("GAME OVER", width/2, height/2 -100);
    minim=new Minim(this);
    player=minim.loadFile("Son Perdu.mp3", 2048);
    player.play();
    noLoop();
  }
  if (Score==2000) { // ""
    fill(255); 
    textSize(200); 
    text("YOU WIN", width/2, height/2 -100);
    minim=new Minim(this);
    player=minim.loadFile("Win.mp3", 2048);
    player.play();
    noLoop();
  }


  fill(255);// couleur affichage du texte SCORE
  textSize(50);// taille de la typo
  text("SCORE:"+Score, 200, 50); // Affichage texte "SCORE" et de sa position
  fill(255);
  textSize(50);
  text("Niveau:"+currentlvl, 200, 100); // Affichage du texte "Niveau" et de sa position. Et fonction qui le fait augmenter d'un niveau lorsque le score max est atteint grace a la variable "currentlvl"

  //image (Curseur, mouseX-50, mouseY-50, 90,90);
  //image( BadEclair,
}

void trace (int a) { // creation d'une fonction qui crée une trainée graphique
  fill (38, 196, 236, a); // cela correspond a l'opacité de la trainée qui prend la valeur locale
  rect (0, 0, width, height);// un rectangle est crée plutot q'un background pour pour regler l'opacité.
}

void stop() // fonction qui stop le son 
{
  player.close(); // fermeture du son
  minim.stop();
  super.stop(); // stop complet
}
