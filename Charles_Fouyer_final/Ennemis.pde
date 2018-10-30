class Ennemis {
  float xDirPasCool = 0.0;
  float yDirPasCool = 0.0; 
  float xpos2;
  float ypos2;

  Ennemis() {

    xDirPasCool= random(5);
    yDirPasCool= random(5);
    xpos2= random(width);
    ypos2=random(height);
  }
  void display(PImage img) {
    // fill(0, 255, 127);
    //stroke(225); // couleur contour
    image (img, xpos2, ypos2, 90, 90);
  }
  void update(float VitBadbubbles) {
    xDirPasCool = xDirPasCool + 0.01;
    xpos2 = xpos2+ (noise(xDirPasCool)-0.5) * VitBadbubbles ;// déplacement plus fluide et nagrace a la fonction noise de coefficient 20 qui joue sur la rapiddité et la fluidité

    yDirPasCool = yDirPasCool + 0.01;
    ypos2 = ypos2+ (noise(yDirPasCool)-0.5) * VitBadbubbles;
  }
  void wrapping() {
    if (xpos2<0) {
      xpos2= width;
    } else if (xpos2>width) {
      xpos2= 0;
    } else if (ypos2<0) {
      ypos2=height;
    } else if (ypos2>height) {
      ypos2= 0;
    }
  }
}
