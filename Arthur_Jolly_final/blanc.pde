float score = 0;

void sup() {
  for (int i = 0; i < bubbles.size(); i ++) {
    Agent a = bubbles.get(i);
    if ( dist(a.xpo, a.ypo, x, y) <=25)// supprime l lles lorsque la balle se rapproche a xdistance de la bulle
    {
      bubbles.remove(i); 
      score = score + 5;
      woow.play();
    }
  }
}
