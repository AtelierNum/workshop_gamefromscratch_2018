//Agent a; //déclaration d'une variable de type agent appellée "a"
ArrayList<Agent> bubbles = new ArrayList<Agent>();//<Agent>=type de classe stockée dans l'ArrayList, "bubbles" = nom des objets
ArrayList<Ennemis> ennemis = new ArrayList<Ennemis>(); //appelle de la liste Ennemis
ArrayList<Niveaux> niveaux = new ArrayList<Niveaux>();//appelle de la liste Niveaux
ArrayList<Ennemis2> ennemis2 = new ArrayList<Ennemis2>(); //appelle de la list Ennemis2
Cercle fishnet; //Cercle=nom de la classe, cercle1=un élément de la classe Cercle 
int SCORE =0; //initialisation de la variable SCORE à zero
int NivActuel =1; //initialisation du compteur de niveau 1 
import ddf.minim.*;
AudioPlayer player;
Minim minim;//audio context
PImage ImageSouris;
PImage ImageEnnemis;
PImage ImageCible;
PImage ImageEnnemis2;


void setup () {
  fullScreen(); //taille plein écran
  //a = new Agent(); //initialisation agent dans le setup
  bubbles.add(new Agent()); //ajout de la classe Agent dans le jeu
  ennemis.add(new Ennemis()); //ajout de la classe Ennemis dans le jeu
  ennemis2.add(new Ennemis2()); //ajout de la classe Ennemis2 dans le jeu
  fishnet=new Cercle(50.0, 50.0); //initialisation de l'objet cercle
  niveaux.add(new Niveaux(160, 360, 1800, 20, 80, 50, 50)); //paramètres du premier niveau, peu d'ennemis mais très rapides, jeu rapide, relexe ++
  niveaux.add(new Niveaux(160, 360, 1800, 20, 80, 50, 50)); //deuxième ligne identique à la première car pas réussi à faire passer l'indicateur de niveau à 2 lorsque Score>50
  niveaux.add(new Niveaux(180, 240, 1800, 15, 70, 40, 100));// second niveau, un peu plus d'ennemis
  niveaux.add(new Niveaux(200, 100, 1800, 10, 45, 30, 150)); //3ème niveau, plus d'ennemis, vitesse réduite
  niveaux.add(new Niveaux(100, 40, 1800, 5, 25, 20, 200)); //4ème niveau, plus d'un ennemi par seconde, mais assez lent
  niveaux.add(new Niveaux(60, 10, 1800, 2, 15, 10, 250)); //5ème niveau, beaucoup beaucoup d'ennemis mais aussi plus d'argent, jeu ralenti , concentration ++
  ImageSouris = loadImage("Curseur.png"); //initialiser l'image du curseur
  ImageEnnemis = loadImage("Ennemis.png");//initialiser l'image de l'ennemi
  ImageCible = loadImage("Argent.png");//initialiser l'image des cibles
  ImageEnnemis2 = loadImage("Ennemis2.png");//initialiser nouvel ennemi
  textAlign(CENTER); // coordonnées programmées = centre bloc texte
  imageMode(CENTER); // coordonnées programmées = centre image
  noCursor(); //faire disparaître le curseur de la souris
}

void draw() {


  trainee(100); //trainée faible grâce à une opacité de 70% du rect qui remplace le background
  fishnet.update(mouseX, mouseY, 0.7); //ajout d'un cercle qui suit la pos de la souris avec latence = 0.7
  fishnet.display(ImageSouris); //afficher l'élément précédent

  if (frameCount%niveaux.get(NivActuel).fPopBlanc==0) { //"frameCount"stock le nombre d'images calculées depuis l'exécution du programme, "%" modulo désigne le nombre entier d'une division // condition vraie toutes les 25 images
    bubbles.add(new Agent()); //ajout d'une nouvelle instance de la classe Agent toutes les 60 frames(=1sec)
    // for (int i=0; i<nbBulle; i++);//tant que nbBulle<50, incrémentation continue
  }

  if (frameCount%niveaux.get(NivActuel).fPopNoir2==0) { //"frameCount"stock le nombre d'images calculées depuis l'exécution du programme, "%" modulo désigne le nombre entier d'une division // condition vraie toutes les 25 images
    ennemis2.add(new Ennemis2()); //ajout d'une nouvelle instance de la classe Agent toutes les 60 frames(=1sec)
    // for (int i=0; i<nbBulle; i++);//tant que nbBulle<50, incrémentation continue
  }

  if (frameCount%niveaux.get(NivActuel).fPopNoir==0) { //"frameCount"stock le nombre d'images calculées depuis l'exécution du programme, "%" modulo désigne le nombre entier d'une division // condition vraie toutes les 25 images
    ennemis.add(new Ennemis()); //ajout d'une nouvelle instance de la classe Ennemis toutes les 60 frames(=1sec)
    // for (int i=0; i<nbBulle; i++);//tant que nbBulle<50, incrémentation continue
  }

  //a.update(); //appel fonction update
  //a.display(); //appel fonction display

  for (int i=0; i<bubbles.size(); i++) { //"bublles.size()" permet de récupérer la taille de l'ArrayList et le nombre de données stockées dedans
    Agent bubble = bubbles.get(i); //Agent c'est la classe, bubble c'est l'instance de la classe. Ce nombre d'instance/d'objet est incrémenté au fil de la boucle grâce à la fonction .get
    bubble.display(ImageCible); //mise à jour de sa position
    bubble.update(niveaux.get(NivActuel).vitBlanc);//appelle la fonction update
    bubble.wrapping();//appelle la fonction wrapping
    if ( dist(bubble.xpos, bubble.ypos, fishnet.x, fishnet.y) < 50) {//le . permet d'accéder aux infos de l'instance bubble, en l'occurence sa position x et sa position y
      bubbles.remove(i); //si condition vraie, on remove l'instance n°i du tableau bubbles
      minim = new Minim(this);
      player = minim.loadFile("Bonus2.mp3", 2048); //jouer le son de bonus
      player.play(); //appel de la fonction play
      SCORE = SCORE+8; //score incrémenté de 8
    }
  }

  for (int i=0; i<ennemis2.size(); i++) { //"ennemis2.size()" permet de récupérer la taille de l'ArrayList et le nombre de données stockées dedans
    Ennemis2 ennemi2 = ennemis2.get(i); //Ennemis2 c'est la classe, ennemi2 c'est l'instance de la classe. Ce nombre d'instance/d'objet est incrémenté au fil de la boucle grâce à la fonction .get
    ennemi2.display(ImageEnnemis2); //mise à jour de sa position
    ennemi2.update(niveaux.get(NivActuel).vitNoir2);//appelle la fonction update
    ennemi2.wrapping();//appelle la fonction wrapping
    if ( dist(ennemi2.xpos3, ennemi2.ypos3, fishnet.x, fishnet.y) < 50) {//le . permet d'accéder aux infos de l'instance ennemi2, en l'occurence sa position x et sa position y
      ennemis2.remove(i); //si condition vraie, on remove l'instance n°i du tableau ennemis2
      minim = new Minim(this);
      player = minim.loadFile("RireTouché.mp3", 2048); //le son "RireTouché" est joué lorsque la condition de distance est vraie
     // player.play();
      SCORE = SCORE-250; // un malus de 250 points est appliqué, Game Over systématique
    }
  }
  for (int i=0; i<ennemis.size(); i++) { //"ennemis.size()" permet de récupérer la taille de l'ArrayList et le nombre de données stockées dedans
    Ennemis ennemi = ennemis.get(i); //Ennemis c'est la classe, ennemi c'est l'instance de la classe. Ce nombre d'instance/d'objet est incrémenté au fil de la boucle grâce à la fonction .get
    ennemi.display(ImageEnnemis); //mise à jour de sa position
    ennemi.update(niveaux.get(NivActuel).vitNoir);//appelle la fonction update
    ennemi.wrapping();//appelle la fonction wrapping
    if ( dist(ennemi.xpos2, ennemi.ypos2, fishnet.x, fishnet.y) < 50) {//le . permet d'accéder aux infos de l'instance ennemi, en l'occurence sa position x et sa position y
      ennemis.remove(i); //si condition vraie, on remove l'instance n°i du tableau ennemçis
      minim = new Minim(this);
      player = minim.loadFile("RireTouché.mp3", 2048); //le son "RireTouché" est joué lorsque la condition de distance est vraie
      //player.play();
      SCORE = SCORE-2; // un malus de 2 points est appliqué
    }
  }

  if (SCORE>niveaux.get(NivActuel).ScoreNextNiv) { //Si le score est supérieur au score max du niveau actuel
    NivActuel++; //on passe au niveau suivant
    minim = new Minim(this);
    player = minim.loadFile("Level Up.mp3", 2048); //son de levelup lorsque scoremax atteint
    player.play();
  }

  if (SCORE>250) { //si score supp a 250
    fill(255); //remplissage blanc
    textSize(120); //taille texte
    strokeWeight(2); //taille contours
    text("VICTOIRE", width/2, height/2-100); //"victoire" affichahe
    textSize(50);
    strokeWeight(2);
    text("Vous pouvez vous échapper !", width/2, height/2);
    textSize(30);
    strokeWeight(2);
    text("click+escape to exit", width/2, height/2+100);
    noLoop(); //arrêt du jeu
    minim = new Minim(this);
    player = minim.loadFile("WIN.mp3", 2048); //musique de winner
    player.play();
  }

  if (SCORE<0) { //si score négatif
    fill(255);
    textSize(75);
    strokeWeight(2);
    text("GAME OVER", width/2, height/2-100); //game over
    fill(255);
    textSize(50);
    text("vous avez été attrappé", width/2, height/2);
    fill(255);
    textSize(30);
    text("click+escape to exit", width/2, height/2+100);
    minim = new Minim(this);
    player = minim.loadFile("GameOver.mp3", 2048); //musique de looser
    player.play();
    noLoop(); //fin de la partie
  }

  fill(255);
  textSize(50);
  text("Niveau:"+NivActuel, 1000, 60); //affichage du niveau


  fill (255); //remplissage texte blanc
  textSize(30); //texte taille 30
  text("Somme dérobéé:$"+SCORE, 180, 50); //affichage texte "your score:" + affichage du score+1, en position 30,30

  //image (ImageSouris, mouseX-50, mouseY-50, 90, 90);
  //image (ImageEnnemis, random(width), random(height), 90, 90);
}

void trainee (int a) { //création de la fonction trainée qui va prendre la valeur de la variable locale
  fill (46, 0, 108, a); //l'opacité de la trainée prend la valeur de la variable locale
  rect (0, 0, width, height); // on utilise le rectangle et pas le background car on peut modifier l'opacité du rectangle. Ici, utile pour cacher successivement et progressivement les cercles de la traînée
}

void stop() //fonction d'arrêt des sons
{
  player.close();
  minim.stop();
  super.stop();
}
