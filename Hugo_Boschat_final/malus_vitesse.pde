class Mvt { //ouverture de la classe
  float xoff=0;
  float yoff=0;
  float xpos;
  float ypos; 

  Mvt() {
    xoff=random(-100, 100);
    yoff=random(-100, 100); 
    xpos=random(-50, 950);
    ypos=random(-50, 950);
  }

  void display () {
    image(imgV, xpos-8, ypos-9);
    stroke(58, 29, 86, 100); //para du contour
    fill(83, 42, 121, 100);//para couleur
  //  ellipse(xpos, ypos, 20, 20);
  }
  void update () { //calcul interne de la position
    xoff=xoff+0.1;
    xpos=xpos+(noise(xoff)-0.5)*dstp;

    yoff=yoff+0.1;
    ypos=ypos+(noise(yoff)-0.5)*dstp;

    if (xpos<=-20) {
      xpos=xpos+width+20;
    }
    if (ypos<=-20) {
      ypos=ypos+height+20;
    }
    if (xpos>=width+20) {
      xpos=xpos-width+20;
    }
    if (ypos>=height+20) {
      ypos=ypos-height+20;
    }
  }
}
