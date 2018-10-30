class Level {
  int popBlanc;
  int popRouge;
  int popMalus;
  int popBonus;
  int levelLength=10;
  Level(int popBlanc,int popRouge, int popMalus, int popBonus, int levelLength) {
    this.popBlanc=popBlanc;
    this.popRouge=popRouge;
    this.popBonus=popBonus;
    this.popMalus=popMalus;
    this. levelLength=levelLength+int(random(6));
  }
}
