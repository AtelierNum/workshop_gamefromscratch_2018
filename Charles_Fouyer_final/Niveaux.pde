class Niveaux { // creation de la class Niveaux
  int FBubbles; // creation de la variable de la frequence d'apparition des bonus 
  int FBadBubbles;//  creation de la variable de la frequence d'apparition des malus1
  float FBadBubbles2; //creation de la variable de la frequence d'apparition des malus2
  int ScoreMax;// creation de la variable ScoreMax  qui permet de changer de niveau quand le score max est atteint
  int VitBubbles;// creation de la variable qui correspond a la vitesse des bonus
  int VitBadbubbles;// creation de la variable qui correspond a la vitesse des malus1
  float VitBadbubbles2;// creation de la variable qui correspond a la vitesse des malus2

  Niveaux (int FBubbles, int FBadBubbles, float FBadBubbles2, int VitBubbles, int VitBadbubbles, float VitBadbubbles2, int ScoreMax) { 
    this.FBubbles= FBubbles; //Fait référence à l'objet actuel ("Cet objet"). cela defini cet objet
    this. FBadBubbles= FBadBubbles;
    this. FBadBubbles2= FBadBubbles2;
    this.ScoreMax= ScoreMax;
    this.VitBubbles= VitBubbles;
    this.VitBadbubbles=VitBadbubbles;
    this.VitBadbubbles2=VitBadbubbles2;
  }
}
