class Level { //Je crée une nouvelle class afin d'y stocker les données qui me permettront de rendre plus difficile chaque niveau. 
  int popBlanc;//Ici la fréquence d'appartition des agents blancs.
  int popRouge;//La fréquence d'apparition des agents rouges. 
  int speedxRouge;//La vitess de déplacement en abscisse des agents rouges.
  int speedyRouge;//La vitess de déplacement en ordonnée des agents rouges.
  int nb2pop;//Le nombre d'agents blancs que je veux faire apparaître pour chaque niveau. 
  int popViePlus;
  int nb2popRouge;
  int nbpopMalus;
  int nbviePlus;
  
  //Je viens ensuite les affilié à mon objet à l'aide de this.
  Level(int popBlanc, int popRouge, int speedxRouge, int speedyRouge, int nb2pop, int popViePlus, int nb2popRouge, int nbpopMalus,int nbviePlus){
    //Les placer entre les parenthèses me permettra de pouvoir modifier les éléments cités ci-dessus à chaque crétation d'un nouvel objet.  
     this.popBlanc=popBlanc;
     this.popRouge=popRouge;
     this.speedxRouge=speedxRouge;
     this.speedyRouge=speedyRouge;
     this.nb2pop = nb2pop;
     this.popViePlus=popViePlus;
     this.nb2popRouge=nb2popRouge;
     this.nbpopMalus=nbpopMalus;
     this.nbviePlus=nbviePlus;
  }
}
