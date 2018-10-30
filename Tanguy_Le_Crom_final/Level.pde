class Level{//base de données en fonction du niveau de jeu
 int popBlanc,nbBlancMax, popRouge,nbRougeMax, popVert, popViolet, popPlus, popMoins, popInvers, popCoeurPlus,popSuper;//fréquence de spawn des Agents et max pop et autres valeurs
 int EatMax;//valeur de score réquise pour atteindre le niveau suivant
  Level(int EatMax,int popBlanc,int nbBlancMax,int popRouge,int nbRougeMax,int popViolet,int popVert,int popPlus,int popMoins,int popInvers, int popCoeurPlus, int popSuper){
    this.EatMax=EatMax;
    this.popBlanc=popBlanc;
    this.nbBlancMax=nbBlancMax;
    this.popRouge=popRouge;
    this.nbRougeMax=nbRougeMax;
    this.popVert=popVert;
    this.popViolet=popViolet;
    this.popPlus=popPlus;
    this.popMoins=popMoins;
    this.popInvers=popInvers;
    this.popCoeurPlus=popCoeurPlus;
    this.popSuper=popSuper;
}
}
