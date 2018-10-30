class Flyer {
  float xpos;
  float ypos;

  Flyer(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
  }

  void display () {
    ellipseMode(CENTER);
    fill(random(255), random(50), random(50), random(100,255));
    ellipse(xpos, ypos, random(60),random(50) );
    ellipse(xpos, ypos, random(50),random(60) );
    fill(255,random(255),random(255));
    ellipse(xpos, ypos, random(40),random(40));
    fill(random(20),random(20),random(20));
    ellipse(xpos, ypos, 20,20 );
    
     fill(random(50,100), random(20), random(20));
    ellipse(xpos, ypos, random(10),random(10) );
  }
 
  
  void update (float xtarget, float ytarget, float sensibility) {
    xpos = attract(xpos, xtarget, sensibility );
    ypos = attract(ypos, ytarget, sensibility);
  }

  float attract (float position, float cible, float sensibilite) {
    float result =(cible-position)*sensibilite + position;
    return result;
  }
}
