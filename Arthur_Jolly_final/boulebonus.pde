
void nice() {
  for (int i = 0; i < bobo.size(); i ++) {
    bonus l = bobo.get(i);
    if ( dist(l.xpo, l.ypo, x, y) <=25)// supprime l lles lorsque la balle se rapproche a xdistance de la bulle
    {
      bobo.remove(i); 
      score = score + 20;
      yes.play();
    }
  }
}
