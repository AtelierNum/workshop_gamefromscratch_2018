class Cercle {
  float xpos;
  float ypos;

  Cercle(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
  }

  void display () {
    ellipseMode(CENTER);
    noFill();
    stroke(random(100), random(100,255), random(100,255), 255);
    ellipse(xpos, ypos, random(35,45), random(35,45));
      stroke(random(100), random(100,255), random(100,255), 255);
    ellipse(xpos, ypos, random(35,45), random(35,45));
      stroke(random(100), random(100,255), random(100,255), 255);
    ellipse(xpos, ypos, random(35,45), random(35,45));
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
