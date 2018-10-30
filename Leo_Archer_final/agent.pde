 // CLASSE DE L AGENT "BUBBLE" LES ASTEROIDES

class Agent {
 // VARIABLES DE POSITION DE L AGENT 
  float xoff = 0.0;
  float yoff = 0.0;

float A = random(0,TWO_PI);
float cof = random(0.01,0.10);
  float xpos;            //définr la variable
  float ypos;
int aleatoire = int(random(0,4));
  Agent() {        //CONSTRUCTEUR
    xoff = random(5);
    yoff = random(5);
  xpos = random(width);
  ypos = random(height);
  }
  
   void display() {
  // FONCTION AFFICHAGE DE L AGENT BUBBLE 
   imageMode(CENTER);
    pushMatrix();
    A+= cof;
    translate(xpos,ypos);
    rotate(A);
    image(img,0,0, 50, 50);
    
    popMatrix();
  }


// FONCTION VITESSE DE L AGENT ET SON DEPLACEMENT 
  void update(float vitesse) {
    xoff = xoff + 0.02;
    xpos = xpos + (noise(xoff)-0.5) *vitesse;

    yoff = yoff + 0.02;
    ypos = ypos + (noise(yoff)-0.5) * vitesse;
  
// FONCTION WRAPPING POUR FAIRE REAPPARAITRE L AGENT SANS LE BLOQUER DANS UN COIN 
  
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
