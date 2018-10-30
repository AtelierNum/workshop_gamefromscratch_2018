class Coeur {
  int posh = 1;
 
  Coeur(int posh){
   this.posh=posh;
    
  }
  PImage heart;
  
  
  void display() {
    
    heart = loadImage("heart3.png");
   
    image(heart,width/2-150 + (posh - 1)*100, height/22, 50, 50);
  }
   
    
}
