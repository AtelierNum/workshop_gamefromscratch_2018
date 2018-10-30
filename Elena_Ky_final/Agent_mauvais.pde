class Bad {  //création de la classe agent
  PImage img;
  float xoff = 0.0;
  float yoff = 0.0;
  Float Vb = 0.5;

  float xR = random (0, width);
  float yR = random (0, height);

  float xpos;
  float ypos;

  float n = noise(xoff) * width; //noice permet de cree un aléatoire plus smouth
  float m = noise(yoff) * height;

  void setup() {
    img = loadImage("tar.png");
  }
  Bad() { 
    xoff = random(-5, 5);
    yoff = random(-5, 5);
    xpos = random (width); //random de popping
    ypos = random(height);
  }

  void display () {
    //noFill();
    //strokeWeight (5);
    //stroke (#E0F3FF);
    image(img, xpos, ypos);
  }
  void update() {
    xoff = xoff + 0.01;
    xpos = xpos+ (noise(xoff)-Vb) * 4;
    yoff = yoff + 0.01;
    ypos = ypos+ (noise(yoff)-Vb) * 4;

    if (xpos <= (0)) { //Wrap pour que les agents passe d'un coté à un autre au liue de sortir de l'écran
      xpos =(width);
    }
    if (xpos >= (width)) { 
      xpos = (0);
    }
    if (ypos <= (0)) { 
      ypos =(height);
    }
    if (ypos >= (height)) { 
      ypos =(0);
    }
  }
}
