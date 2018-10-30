void mousePressed() {
  if (Win || Lose) {//si l'écran de fin de jeu est affiché
    Win=false;
    Lose=false;
    reset();//fonction reset du jeu
  }
}
