// CLASSE BONUS 

class Bonus {
 float xoff = 0.0;
 float yoff = 0.0;
 
 float xpos;
 float ypos;
 int aleatoire = int(random(0,3));
 
 Bonus(){
   
  xoff = random(5); 
  yoff = random(5);
  xpos = random(width);
  ypos = random(height);

   
 }

void display() {
 noStroke();
 fill(#FFE705);
 ellipse(xpos , ypos, 15,15);
  }
  void update(float vitesse) {
    xoff = xoff + 0.10;
    xpos = xpos + (noise(xoff)-0.5) *vitesse;

    yoff = yoff + 0.10;
    ypos = ypos + (noise(yoff)-0.5) * vitesse;
 
 
 
  if (xpos <= (0-25)) {
      xpos =(width);
    }
      if (xpos >= (width+25)) {
        xpos = (0);
      }

      if (ypos >= (height+25)) {
        ypos = (0);
      }

      if (ypos <=(-25)) {
        ypos = (height);
      } 
  
  }

}
