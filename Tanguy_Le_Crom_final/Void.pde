//Onglet comprennant les fonctions

void trainee(float a) {//effet graphique
  t+=1;
  float T=map(noise(t), 0, 1, 25, 160);
  fill(0, 0, T, a);//noir transparent
  rect(-1, -1, width+1, height+1);//rectangle faisant office de background
  textSize(700);
  textAlign(CENTER, CENTER);
  fill(T-30, T-30, T, a);//noir transparent
  text(+currentLvl, width/2-50, height/2-100);
}

void popper() {// fonction pour le spawn des agents
  textAlign(CENTER);
  if (frameCount%(lvl.get(currentLvl).popBlanc)==0 && WVague.size()<lvl.get(currentLvl).nbBlancMax) {// si le nombre de frame est un multiple de 60 alors ...
    WVague.add(new Agent(random(0, width), random(0, height), 0));// on ajoute un agent blanc n'importe où dans la fenêtre de jeu
  }
  if (frameCount%(lvl.get(currentLvl).popRouge)==0 && RVague.size()<lvl.get(currentLvl).nbRougeMax) {
    RVague.add(new Agent(random(0, width), random(0, height), 1));// on ajoute un agent rouge n'importe où dans la fenêtre de jeu
  }
  if (frameCount%(lvl.get(currentLvl).popVert)==0 && VVague.size()<5) {
    VVague.add(new Agent(random(0, width), random(0, height), 2));// on ajoute un agent rouge n'importe où dans la fenêtre de jeu
  }
  if (frameCount%(lvl.get(currentLvl).popViolet)==0 && MVague.size()<15) {
    MVague.add(new Agent(random(0, width), random(0, height), 3));// on ajoute un agent rouge n'importe où dans la fenêtre de jeu
  }
  if (frameCount%(lvl.get(currentLvl).popPlus)==0 && Plus.size()<10) {
    Plus.add(new Agent(random(0, width), random(0, height), 4));// on ajoute un agent rouge n'importe où dans la fenêtre de jeu
  }
  if (frameCount%(lvl.get(currentLvl).popMoins)==0 && Moins.size()<10) {
    Moins.add(new Agent(random(0, width), random(0, height), 5));// on ajoute un agent rouge n'importe où dans la fenêtre de jeu
  }
  if (frameCount%(lvl.get(currentLvl).popInvers)==0 && Invers.size()<4) {
    Invers.add(new Agent(random(0, width), random(0, height), 6));// on ajoute un agent rouge n'importe où dans la fenêtre de jeu
  }
  if (frameCount%(lvl.get(currentLvl).popCoeurPlus)==0 && CoeurPlus.size()<4) {
    CoeurPlus.add(new Agent(random(0, width), random(0, height), 7));// on ajoute un agent rouge n'importe où dans la fenêtre de jeu
  }
  if (frameCount%(lvl.get(currentLvl).popSuper)==0 && Super.size()<4) {
    Super.add(new Agent(random(0, width), random(0, height), 8));// on ajoute un agent rouge n'importe où dans la fenêtre de jeu
  }
}


void catching() { // fonction pour supprimer les agents attrapés
  textSize(30);
  for (int j=0; j<2; j++) {
    for (int i=0; i<WVague.size(); i++) {// on verifie pour tout les agents
      if (dist(Player[j].X, Player[j].Y, WVague.get(i).X, WVague.get(i).Y)<Player[j].d/2-WVague.get(i).d/2) {//si la totalité de l'agent rentre dans le cercle de la souris
        fill(255);
        text("+"+int(100*(WVague.get(i).coef/10)), WVague.get(i).X-50, WVague.get(i).Y-80);//affichage du gain de point
        Player[j].score+=100*(WVague.get(i).coef/10);//gain de points
        BlancEat++;
        WVague.remove(i);//supprime l'agent survolé par le cercle, le tableau des agents perd une cellule et décale toutes les autres cellules pour prendre le moins de place possible
        agent.play();  //joue le son en question
      }
    }
    for (int i=0; i<RVague.size(); i++) {// on verifie pour tout les agents
      if (dist(Player[j].X, Player[j].Y, RVague.get(i).X, RVague.get(i).Y)<Player[j].d/2-RVague.get(i).d/2) {//si la totalité de l'agent rentre dans le cercle de la souris
        fill(255, 0, 0);
        text("-"+int(200*(RVague.get(i).coef/10))+"  hurt", RVague.get(i).X-50, RVague.get(i).Y-50);//affichage de la perte de point
        if(!Player[j].SuperMode){
        Player[j].score-=200*(RVague.get(i).coef/10);//perte de points
        }
        RVague.remove(i);//supprime l'agent survolé par le cercle, le tableau des agents perd une cellule et décale toutes les autres cellules pour prendre le moins de place possible 
        agent.play();//joue le son en question
        if (!Player[j].SuperMode) {
          if (j==0) {
            coeurs1.remove(coeurs1.size()-1);
          } else if (j==1) {
            coeurs2.remove(coeurs2.size()-1);
          }
        }
      }
    }
    for (int i=0; i<VVague.size(); i++) {// on verifie pour tout les agents
      if (dist(Player[j].X, Player[j].Y, VVague.get(i).X, VVague.get(i).Y)<Player[j].d/2-VVague.get(i).d/2) {//si la totalité de l'agent rentre dans le cercle de la souris
        fill(#73FF71);
        text("speed++", VVague.get(i).X-50, VVague.get(i).Y-50);//affiche du texte au dessus de l'objet
        VVague.remove(i);//supprime l'agent survolé par le cercle, le tableau des agents perd une cellule et décale toutes les autres cellules pour prendre le moins de place possible
        if (Player[j].coef<25) {
          Player[j].coef*=1.5;
          speed.play();//joue le son en question
        }
      }
    }
    for (int i=0; i<MVague.size(); i++) {// on verifie pour tout les agents
      if (dist(Player[j].X, Player[j].Y, MVague.get(i).X, MVague.get(i).Y)<Player[j].d/2-MVague.get(i).d/2) {//si la totalité de l'agent rentre dans le cercle de la souris
        fill(#9037D1);
        text("speed--", MVague.get(i).X-50, MVague.get(i).Y-50);//affiche du texte au dessus de l'objet
        MVague.remove(i);//supprime l'agent survolé par le cercle, le tableau des agents perd une cellule et décale toutes les autres cellules pour prendre le moins de place possible
        if (Player[j].coef>0.1) {
          Player[j].coef/=1.5;
          slow.play();//joue le son en question
        }
      }
    }
    for (int i=0; i<Plus.size(); i++) {// on verifie pour tout les agents
      if (dist(Player[j].X, Player[j].Y, Plus.get(i).X, Plus.get(i).Y)<Player[j].d/2-Plus.get(i).d/2) {//si la totalité de l'agent rentre dans le cercle de la souris
        fill(#00ACFF);
        text("grow", Plus.get(i).X-50, Plus.get(i).Y-50);//affiche du texte au dessus de l'objet
        Plus.remove(i);//supprime l'agent survolé par le cercle, le tableau des agents perd une cellule et décale toutes les autres cellules pour prendre le moins de place possible
        if (Player[j].d<200) {
          Player[j].d+=10;//diametre du cercle de la souris augmente
          grow.play();//joue le son en question
        }
      }
    }
    for (int i=0; i<Moins.size(); i++) {// on verifie pour tout les agents
      if (dist(Player[j].X, Player[j].Y, Moins.get(i).X, Moins.get(i).Y)<Player[j].d/2-Moins.get(i).d/2) {//si la totalité de l'agent rentre dans le cercle de la souris
        fill(#FFAA00);
        text("shrink", Moins.get(i).X-50, Moins.get(i).Y-50);//affiche du texte au dessus de l'objet
        Moins.remove(i);//supprime l'agent survolé par le cercle, le tableau des agents perd une cellule et décale toutes les autres cellules pour prendre le moins de place possible
        if (Player[j].d>30) {
          Player[j].d-=10;//diametre du cercle de la souris diminu
          shrink.play();//joue le son en question
        }
      }
    }
    for (int i=0; i<Invers.size(); i++) {// on verifie pour tout les agents
      if (dist(Player[j].X, Player[j].Y, Invers.get(i).X, Invers.get(i).Y)<Player[j].d/2-Invers.get(i).d/2) {//si la totalité de l'agent rentre dans le cercle de la souris
        fill(#FFAA00);
        text("Inverse", Invers.get(i).X-50, Invers.get(i).Y-50);//affiche du texte au dessus de l'objet
        Invers.remove(i);//supprime l'agent survolé par le cercle, le tableau des agents perd une cellule et décale toutes les autres cellules pour prendre le moins de place possible
        if (!Player[j].SuperMode) {
          Player[j].inverse=true;//inversement des contrôles activé
          Player[j].Xinv=Player[j].X*2;//prise en compte de la position actuelle du cercle de la souris
          Player[j].Yinv=Player[j].Y*2;//
          Player[j].incrInv=0;//incrInv remis à 0 car permet de mettre une durée à l'effet d'inversion
          inverse.play();//joue le son en question
        }
      }
    }
    for (int i=0; i<CoeurPlus.size(); i++) {// on verifie pour tout les agents
      if (dist(Player[j].X, Player[j].Y, CoeurPlus.get(i).X, CoeurPlus.get(i).Y)<Player[j].d/2-CoeurPlus.get(i).d/2) {//si la totalité de l'agent rentre dans le cercle de la souris
        fill(0, 255, 0);
        if (coeurs1.size()<8)
          text("hill++", CoeurPlus.get(i).X-50, CoeurPlus.get(i).Y-50);//affiche du texte au dessus de l'objet
        CoeurPlus.remove(i);//supprime l'agent survolé par le cercle, le tableau des agents perd une cellule et décale toutes les autres cellules pour prendre le moins de place possible
        if (coeurs1.size()<8 || coeurs2.size()<8) {
          if (j==0) {
            coeurs1.add(new Coeur());//création d'un nouveau coeur
          } else if (j==1) {
            coeurs2.add(new Coeur());//création d'un nouveau coeur
          }
        }
        agent.play();//joue le son en question
      }
    }
    for (int i=0; i<Super.size(); i++) {// on verifie pour tout les agents
      if (dist(Player[j].X, Player[j].Y, Super.get(i).X, Super.get(i).Y)<Player[j].d/2-Super.get(i).d/2) {//si la totalité de l'agent rentre dans le cercle de la souris
        fill(255,255,0);
        text("!!! SUPER !!!", Super.get(i).X-50, Super.get(i).Y-80);//affichage du gain de point
        Player[j].score+=1000;//gain de points
        Player[j].SuperMode=true;
        Super.remove(i);//supprime l'agent survolé par le cercle, le tableau des agents perd une cellule et décale toutes les autres cellules pour prendre le moins de place possible
        agent.play();  //joue le son en question
        superMusic.play();
      }
    }
  }
}

void UXDisplay() {//affichage du score et du niveau à l'écran
  for (int j=0; j<2; j++) {
    fill(0, 20);
    noStroke();

    rect(20, 20, 300, 50, 10);
    fill(255);

    if (Player[j].score<0) {// si score négatif, couleur de l'affichage en rouge
      fill(255, 0, 0);//joue le son en question
    }
    textSize(30);
    textAlign(LEFT, BOTTOM);
    text("Score Player "+(j+1)+" : "+int(Player[j].score), 30+800*j, 65+720*j);
  }
  fill(255);
  /*  textAlign(CENTER, CENTER);
   ellipse(width-40, 100, 50, 50);
   text(BlancEat+" : ", width-120, 100);*/
}

void levelUp() {//Passage de niveau
  if (BlancEat>=lvl.get(currentLvl).EatMax) {// si le score dépasse le score réquis pour passer au niveau suivant, alors monte d'un niveau
    currentLvl++;
    if (currentLvl==lvl.size()) {//si le niveau actuel est le niveau maximum
      Win=true;//alors le joueur à gagné
      GameOver.play();
    }
  }
}

void coeurDisplay() {//affichage des coeurs
  for (int i=0; i<coeurs1.size(); i++) {
    coeurs1.get(i).display(35, 100, i);
  }
  for (int i=0; i<coeurs2.size(); i++) {
    coeurs2.get(i).display(1050, 830, i);
  }
}

void Ending() {//fonction de fin de jeu, affichage
  t+=1;
  float T=map(noise(t), 0, 1, 0, 125);
  background(T, T/2, 0);
  if (Win) {

    fill(255, 255, 0);
    textSize(150);
    textAlign(CENTER, CENTER);
    text("LVL MAX REACHED !!!", width/2, 380);
    textSize(50);
    for (int i=0; i<2; i++) {
      text("score Player "+(i+1)+" : "+int(Player[i].score), width/2, 500+90*i);
    }
    text("Click to replay", width/2, 700);
  } else if (Lose) {
    fill(255, 255, 0);
    textSize(150);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width/2, 170);
    textSize(50);
    if (coeurs1.size()==0) {
      text("Player 1  Win", width/2, 300);
    } else {
      text("Player 2  Win", width/2, 300);
    }
    for (int i=0; i<2; i++) {
      text("score Player "+(i+1)+" : "+int(Player[i].score), width/2, 500+90*i);
    }
    text("Click to replay", width/2, 700);
  }
}
