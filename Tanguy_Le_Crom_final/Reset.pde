void reset() {//fonction de reset des données pour refaire une partie
  
  Player[0] = new Cercle(300,300,1);//objet de type "Cercle"
  Player[1] = new Cercle(width-300,height-300,2);//objet de type "Cercle"
  WVague = new ArrayList<Agent>();// tableau d'objets de type "Agent" blanc
  RVague = new ArrayList<Agent>();//tableau d'objets de type "Agent" rouge
  VVague = new ArrayList<Agent>();//tableau d'objets de type "Agent" vert/bonus vitesse
  MVague = new ArrayList<Agent>();//tableau d'objets de type "Agent" violet/malus vitesse
  Plus = new ArrayList<Agent>();//tableau d'objets de type "Agent" bleu "taille plus"
  Moins = new ArrayList<Agent>();//tableau d'objets de type "Agent" orange "taille moins"
  Invers = new ArrayList<Agent>();
  CoeurPlus = new ArrayList<Agent>();
  Super = new ArrayList<Agent>();
  coeurs1 = new ArrayList<Coeur>();
  coeurs2 = new ArrayList<Coeur>();
  for (int i=0; i<3; i++) {//réinitialisation des coeurs
    coeurs1.add(new Coeur());
    coeurs2.add(new Coeur());
  }  
  currentLvl=1;
  BlancEat=0;
}
