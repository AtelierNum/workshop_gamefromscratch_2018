void enemie() {
  for (int i = 0; i < redshit.size(); i ++) {
    mechant b = redshit.get(i);
    if ( dist(b.xpo, b.ypo, x, y) <=25)// supprime les bulles lorsque la balle se rapproche a xdistance de la bulle
    {
      redshit.remove(i); 
      score = score - 5;
      gg.play();
     
    }
  }
}
