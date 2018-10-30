
// FONCTION ECLATER 

void eclater(){
  for (int i = 0 ; i < bubbles.size(); i ++) {
    Agent a = bubbles.get(i);
   if( dist(a.xpos, a.ypos, cercle.x, cercle.y) <= 30){
     bubbles.remove(i);
     wrong.play();
     
    score = score -100;
 }
  }
   for (int i = 0 ; i < pills.size(); i ++) {
    Point p = pills.get(i);
    if( dist(p.xpos, p.ypos, cercle.x, cercle.y) <= 25){
     pills.remove(i); 
     good.play();
     
 //    nombreframe = 0;
     score = score +50;
    }
   }
   for(int i = 0; i< bonus.size(); i++) {
    Bonus b = bonus.get(i);
    if(dist(b.xpos, b.ypos, cercle.x, cercle.y) <=15) {
      bonus.remove(i);
     if (frameCount%lvl.get(clvl).fBlanc==0 && pills.size()<30) {
        pills.add(new Point());
      } 
      
       
  }
   }
}
