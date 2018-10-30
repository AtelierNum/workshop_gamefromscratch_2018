float xpos;
float ypos; 
float i;
float posx= 0;
float posy =0;
float lag =0.30;
int clvl=0;

int agt= 0;
int agtb= 2;
float dstn=1;
float dstp=15;
int anyf=100;
int sec= 0; 
int minu = 0;
int scr =100;
boolean play = true;
Enn auto; //déclaration d'un nouvel objet
Pot bns;
Mvt len;
Nbm anb;
Lvl level;

ArrayList<Enn> agot = new ArrayList<Enn>();
ArrayList<Pot> ptb = new ArrayList<Pot>();
ArrayList<Mvt> let = new ArrayList<Mvt>();
ArrayList<Nbm> nbb = new ArrayList<Nbm>();
ArrayList<Lvl> niv = new ArrayList();

import ddf.minim.*;
AudioPlayer player;
Minim minim;

PImage imgB;
PImage imgM;
PImage imgN;
PImage imgV;
PImage imgP;
PImage imgF;


void setup () {


  size(1500, 900); // crès l'onglet du prog, définis sa taille

  agot.add(new Enn());
  ptb.add(new Pot());
  let.add(new Mvt());
  nbb.add(new Nbm());
  niv.add(new Lvl(5, 3, 2, 1, 50, 1, 1000, 0));
  niv.add(new Lvl(6, 4, 2, 1, 45, 2, 2000, 999)); 
  niv.add(new Lvl(7, 4, 3, 1, 45, 3, 3000, 1999));
  niv.add(new Lvl(7, 4, 3, 1, 40, 4, 4000, 2999));
  niv.add(new Lvl(7, 5, 3, 1, 40, 5, 5000, 3999));
  niv.add(new Lvl(8, 5, 3, 1, 35, 6, 6000, 4999));
  niv.add(new Lvl(9, 5, 4, 1, 35, 7, 7000, 5999));
  niv.add(new Lvl(9, 5, 4, 2, 30, 8, 8000, 6999));
  niv.add(new Lvl(10, 5, 5, 3, 10, 9, 9000, 7999));
  niv.add(new Lvl(1, 1, 1, 13, 10, 10, 10000, 9000));
  niv.add(new Lvl(1, 1, 1, 13, 10, 10, 10000, 0));


  noCursor();


  minim = new Minim(this);
  player= minim.loadFile("fond.wav", 2048);
  player.play();

  imgB = loadImage("BBB.png");
  imgM = loadImage("MMM.png");
  imgN = loadImage("NNN.png");
  imgV = loadImage("VVV.png");
  imgP = loadImage("PPP.png");
  imgF = loadImage("FFF.png");
}

void draw() { //la "boucle"

  tra(250); //fond différé
  if (frameCount%60 == 0) {
    sec = sec +1;
  }

  image(imgB, posx-42, posy-40); //le cercle est déssiné et suit la souris sur la fenêtre
  strokeWeight(2); //taille du contour
  stroke(245, 190, 0, 250); //para du contour
  fill(231, 175, 0, 120); //colorise le cercle
  //ellipse(posx, posy, 50, 50); //le cercle est déssiné et suit la souris sur la fenêtre
  posx=atra(mouseX, posx, lag);
  posy=atra(mouseY, posy, lag);




  println(clvl, niv.size(), play);
  if (scr>niv.get(clvl).scrmax && clvl<niv.size()-1 && play == true) {  
    clvl++;
  } else if ( clvl==niv.size()-1) {
    play = false;
  }

  if (play) {
    if (frameCount%niv.get(clvl).anyfr==0 && agot.size()<=niv.get(clvl).spwen ) {
      agot.add(new Enn());
    }


    if (frameCount%niv.get(clvl).anyfr==0 && ptb.size()<=niv.get(clvl).spwpt) {
      ptb.add(new Pot());
    }

    if (frameCount%niv.get(clvl).anyfr==0 && let.size()<=niv.get(clvl).spwmn) {
      let.add(new Mvt());
    }

    if (frameCount%niv.get(clvl).anyfr==0 && nbb.size()<=niv.get(clvl).spwvt) {
      nbb.add(new Nbm());
    }



    for (int i=0; i<agot.size(); i++) { //i = "identifiant" objet
      Enn auto = agot.get(i);
      auto.display(); 
      auto.update (); //mise de l'objet dans la boucle draw
      if (dist(posx, posy, auto.xpos, auto.ypos)<50) {
        agot.remove(i);
        scr=scr-100;
        minim = new Minim(this);
        player= minim.loadFile("malus.wav", 2048);
        player.play();
      }
    }

    for (int i=0; i<ptb.size(); i++) { //i = "identifiant" objet
      Pot bns = ptb.get(i);
      bns.display(); 
      bns.update (); //mise de l'objet dans la boucle draw
      if (dist(posx, posy, bns.xpos, bns.ypos)<40) {
        ptb.remove(i);
        scr=scr+50;
        minim = new Minim(this);
        player= minim.loadFile("bonus.wav", 2048);
        player.play();
      }
    }

    for (int i=0; i<let.size(); i++) { //i = "identifiant" objet
      Mvt len = let.get(i);
      len.display(); 
      len.update (); //mise de l'objet dans la boucle draw
      if (dist(posx, posy, len.xpos, len.ypos)<30) {
        let.remove(i);
        scr=scr+100;
        dstn=dstn+2;
        minim = new Minim(this);
        player= minim.loadFile("mouv.wav", 2048);
        player.play();
      }
    }

    for (int i=0; i<nbb.size(); i++) { //i = "identifiant" objet
      Nbm anb = nbb.get(i);
      anb.display(); 
      anb.update (); //mise de l'objet dans la boucle draw
      if (dist(posx, posy, anb.xpos, anb.ypos)<30) {
        nbb.remove(i);
        scr=scr+200;
        agot.add(new Enn());
        agot.add(new Enn());
        minim = new Minim(this);
        player= minim.loadFile("nombre.wav", 2048);
        player.play();
      }
    }
  }

  if (scr>niv.get(clvl).gamo && play == false) {
    play = false;
    //if (scr>niv.get(clvl).scrmax) {   //  if (scr>niv.get(clvl).scrmax && clvl<niv.size()) {
    fill(231, 175, 0, 250);
    textSize(150);
    text("VICTOIRE", CENTER+width/4+25, height/2+50);
    noLoop();
  } else if (scr<niv.get(clvl).gamo ) { //bug arrvié a victoire //&& play ==false
    play = false;
    fill(250);
    textSize(150);
    text("GAME OVER", CENTER+width/4-75, 250);
    fill(250);
    textSize(150);
    text("GAME OVER", CENTER+width/4-75, 770);
    noLoop();
    sec=sec-1;
  }

  fill(255);
  textSize(25);
  text("Score:"+scr, width/2-70, height-20);

  fill(255);
  textSize(25);
  text("Niveau:"+clvl, width/2-70, 35);

  fill(255);
  textSize(25);
  text("Chrono:"+sec, width/2-70, height-55);
}

void tra (int trs) {
  fill( 23, 32, 42, trs); //definition de l'opacité du "fond"
  image(imgF, 0, 0);
}

float atra (float cibl, float posi, float sensi) { //mise en place de la fonction de traine
  return (cibl-posi)*sensi+posi;
}
