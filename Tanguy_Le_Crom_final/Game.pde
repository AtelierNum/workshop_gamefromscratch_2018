//Le corps du jeu
void Game() {

  trainee(60);//en diminuant l'entier on augmente la taille de la trainée du cercle
for(int i=0;i<2;i++){
  Player[i].update();//appelle la fonction update() depuis la classe "Cercle"
  Player[i].display();//appelle la fonction display() depuis la classe "Cercle"
}

  for (Agent agents : WVague) {//on appelle tout les agents de notre liste "vague"
    agents.update();//appelle la fonction update
    agents.display();//affichage
  }
  for (Agent agents : RVague) {//on appelle tout les agents de notre liste "vague"
    agents.update();//appelle la fonction update
    agents.display();//affichage
  }
  for (Agent agents : VVague) {//on appelle tout les agents de notre liste "vague"
    agents.update();//appelle la fonction update
    agents.display();//affichage
  }
  for (Agent agents : MVague) {//on appelle tout les agents de notre liste "vague"
    agents.update();//appelle la fonction update
    agents.display();//affichage
  }
  for (Agent agents : Plus) {//on appelle tout les agents de notre liste "vague"
    agents.update();//appelle la fonction update
    agents.display();//affichage
  }
  for (Agent agents : Moins) {//on appelle tout les agents de notre liste "vague"
    agents.update();//appelle la fonction update
    agents.display();//affichage
  }
  for (Agent agents : Invers) {//on appelle tout les agents de notre liste "vague"
    agents.update();//appelle la fonction update
    agents.display();//affichage
  }
  for (Agent agents : CoeurPlus) {//on appelle tout les agents de notre liste "vague"
    agents.update();//appelle la fonction update
    agents.display();//affichage
  }
  for (Agent agents : Super) {//on appelle tout les agents de notre liste "vague"
    agents.update();//appelle la fonction update
    agents.display();//affichage
  }

  popper();
  catching();
  levelUp();
  UXDisplay();
  coeurDisplay();
  
  if(coeurs1.size()==0 || coeurs2.size()==0){//si un des joeurs n'a plus de coeurs alors Game over
   Lose=true;
   GameOver.play();
  }
  
}
