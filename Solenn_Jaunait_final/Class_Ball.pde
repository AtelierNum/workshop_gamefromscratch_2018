class Ball {
  float xpos;
  float ypos;
  float vieMax = 5;
  float vieMin = 0;

  Ball(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
  }

  void display() {
    imageMode(CENTER);
    noFill();
    stroke(255,255,255);
    image(homer,xpos, ypos, 60, 70);
  }

  float attract (float position, float cible, float sensibility) {
    float result = (cible - position)*sensibility + position;
    return result;
  }

  void update (float xtarget, float ytarget, float sensibility) {
    xpos = attract(xpos, xtarget, sensibility);
    ypos = attract(ypos, ytarget, sensibility);
  }
}
