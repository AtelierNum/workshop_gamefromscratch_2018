class Ennemis2 {
  float xDirPasCool2 = 0.0;
  float yDirPasCool2 = 0.0; 
  float xpos3;
  float ypos3;

  Ennemis2() {

    xDirPasCool2= random(5);
    yDirPasCool2= random(5);
    xpos3= random(width);
    ypos3=random(height);
  }
  void display(PImage img) {
    // fill(0, 255, 127);
    //stroke(225); // couleur contour
    image (img, xpos3, ypos3, 50, 50);
  }
  void update(float VitBadbubbles2) {
    xDirPasCool2 = xDirPasCool2 + 0.01;
    xpos3 = xpos3+ (noise(xDirPasCool2)-0.5) * VitBadbubbles2 ;// déplacement plus fluide et nagrace a la fonction noise de coefficient 20 qui joue sur la rapiddité et la fluidité

    yDirPasCool2 = yDirPasCool2 + 0.01;
    ypos3 = ypos3+ (noise(yDirPasCool2)-0.5) * VitBadbubbles2;
  }
  void wrapping() {
    if (xpos3<0) {
      xpos3= width;
    } else if (xpos3>width) {
      xpos3= 0;
    } else if (ypos3<0) {
      ypos3=height;
    } else if (ypos3>height) {
      ypos3= 0;
    }
  }
}
