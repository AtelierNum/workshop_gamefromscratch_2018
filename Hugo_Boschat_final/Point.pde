class Pot { //ouverture de la classe
  float xoff=0;
  float yoff=0;
  float xpos;
  float ypos; 
  int tap=35;
  Pot() {
    xoff=random(-100, 100);
    yoff=random(-100, 100); 
    xpos=random(-50, 950);
    ypos=random(-50, 950);
  }

  void display () {
    image(imgP, xpos-23, ypos-23);
    stroke(115, 198, 182, 100); //para du contour
    fill(69, 179, 157, 100);//para couleur
   // ellipse(xpos, ypos, tap, tap);
  }


  void update () { //calcul interne de la position
    xoff=xoff+0.1;
    xpos=xpos+(noise(xoff)-0.5)*dstp;

    yoff=yoff+0.1;
    ypos=ypos+(noise(yoff)-0.5)*dstp;

    if (xpos<=-tap) {
      xpos=xpos+width+tap;
    }
    if (ypos<=-tap) {
      ypos=ypos+height+tap;
    }
    if (xpos>=width+tap) {
      xpos=xpos-width+tap;
    }
    if (ypos>=height+tap) {
      ypos=ypos-height+tap;
    }
  }
}
