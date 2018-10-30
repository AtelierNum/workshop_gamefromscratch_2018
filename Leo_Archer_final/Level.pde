
// CLASSE NIVEAU 

class Level {  
 // VARIABLES CONTENUES DANS LE NIVEAU 
  int fBlanc; 
  int fRouge;
  int ScoreMax;
  int coef;
  int ScoreMin;
  int bonus;
 
  Level(int fBlanc, int fRouge, int ScoreMax, int coef,int  ScoreMin, int bonus) {   //CONSTRUCTEUR ET SES ARGUMENTS 
    this.fBlanc = fBlanc; 
    this.fRouge = fRouge;
    this.ScoreMax = ScoreMax;
    this.coef = coef;
    this.ScoreMin = ScoreMin;
    this.bonus = bonus;
  }
}
