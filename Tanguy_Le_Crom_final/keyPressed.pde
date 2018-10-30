boolean AisLeft, AisRight, AisUp, AisDown; //controles joueurs 1
boolean BisLeft, BisRight, BisUp, BisDown; // controles joueurs 2

void keyPressed() {
  setMove(keyCode, true);//enregistre la touche active
}
 
void keyReleased() {
  setMove(keyCode, false);//enregistre un booléen quand la touche se désactive
}

boolean setMove(int k, boolean b) {//fonction retournant la touche active ou désactivée
  switch (k) {
  case UP :
    return AisUp = b;
 
  case DOWN:
    return AisDown = b;
 
  case LEFT:
    return AisLeft = b;
 
  case RIGHT:
    return AisRight = b;
    
 case 68:
    return BisUp = b;
 
  case 65:
    return BisDown = b;
 
  case 83:
    return BisLeft = b;
 
  case 87:
    return BisRight = b;
 
  default:
    return b;
  }
}
