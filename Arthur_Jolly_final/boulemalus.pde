void oops() {
  for (int i = 0; i < mama.size(); i ++) {
    malus m = mama.get(i);
    if ( dist(m.xpo, m.ypo, x, y) <=45)// supprime l lles lorsque la balle se rapproche a xdistance de la bulle
    {
      mama.remove(i); 
      score = score - 30;
      prout.play();
      
      
    }
  }
}
