class Enn { //ouverture de la classe
  float xoff=0;
  float yoff=0;
  float xpos;
  float ypos; 
  int tae=50;
  Enn() {
    xoff=random(-100, 100);
    yoff=random(-100, 100); 
    xpos=random(-50, 950);
    ypos=random(-50, 950);
  }

  void display () {
    image(imgM, xpos-32, ypos-34);
    stroke(152, 0, 0, 100); //para du contour
    fill(152, 0, 0, 100);//para couleur
   // ellipse(xpos, ypos, tae, tae);
  }


  void update () { //calcul interne de la position
    xoff=xoff+0.1;
    xpos=xpos+(noise(xoff)-0.5)*dstn;

    yoff=yoff+0.1;
    ypos=ypos+(noise(yoff)-0.5)*dstn;

    if (xpos<=-tae) {
      xpos=xpos+width+tae;
    }
    if (ypos<=-tae) {
      ypos=ypos+height+tae;
    }
    if (xpos>=width+tae) {
      xpos=xpos-width+tae;
    }
    if (ypos>=height+tae) {
      ypos=ypos-height+tae;
    }
  }
}
