class Lvl {

  int spwen; //valeur du spawn des rouges
  int spwpt; //valeur de spawn des bleus
  int spwmn; //valeur de spawn malus violet
  int spwvt; //valeur de spawn malus jaunes
  int anyfr; //valeur de rapidité de spawn
  int clvl; //valeur de level
  int scrmax;//valeur de score max pour passer niveau
  int gamo; //score a ne pas passer en dessous au risque de Game Over

  Lvl (int spwen, int spwpt, int spwmn, int spwvt, int anyfr, int clvl, int scrmax, int gamo) {
    this.spwen=spwen;
    this.spwpt=spwpt;
    this.spwmn=spwmn;
    this.spwvt=spwvt;
    this.anyfr=anyfr;
    this.clvl=clvl;
    this.scrmax=scrmax;
    this.gamo=gamo;
  }
}
