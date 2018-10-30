class Malus {
  float xpos = random(width);
  float ypos = random(height);

  Malus() {
  }

  void display() {
    noFill();
    stroke(random(255),random(255),random(255));
    ellipse(xpos, ypos, 20, 20);
  }

  float attract (float position, float cible, float sensibility) {
    float result = (cible - position)*sensibility + position;
    return result;
  }

  void update () {
    xpos = attract(xpos, mouseX, 0.005);
    ypos = attract(ypos, mouseY, 0.005);
  }
}
