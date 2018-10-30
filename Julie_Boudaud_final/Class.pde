
class Ball {
  float xpos;
  float ypos;

  Ball(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
  }

  // this = cette valeur ou cette fonction 

  void display() {
    fill(255);
    ellipse(xpos, ypos, 50, 50);
  }

  //taille + position ellipse

  float attract(float position, float target, float sensivity) {
    return (target - position)* sensivity + position;
  }

  //attraction de la balle avec la souris, la boule suit le mouvement de la souris

  void update(float xtarget, float ytarget, float sensivity) {
    xpos = attract (xpos, xtarget, sensivity);
    ypos = attract (ypos, ytarget, sensivity);
  }

  //actualiser la position de la balle
}

// ellipse qui suit ma souris, calcule



class Agent {

  float xoff = 0.0;
  float yoff = 0.0;

  float xpos;
  float ypos;

  //position du cercle

  Agent(float x, float y) {
    xoff = random(5);
    yoff = random (5);
    xpos = x;
    ypos = y;
  }

  void display() {
    fill(255);
    image(imgplante, xpos - 16, ypos - 16, 35, 35);
  }



  void update() {
    xoff = xoff + 0.01;
    xpos = xpos + (noise(xoff)-0.5) * 4;

    yoff = yoff + 0.01;
    ypos = ypos + (noise(yoff)-0.5) * 4;
    //vitesse de déplacement et zone de déplacement , + ou - vite

    if (xpos < -30) {
      xpos = xpos + width + 30;
    }
    if (ypos < -30) {
      ypos = ypos + height + 30;
    }
    if (xpos > width + 30) {
      xpos = xpos + width - 30;
    }
    if (ypos > height + 30) {
      ypos = ypos + height - 30;
    }
    // Calcule pour que mes boules passe de l'autre coté de mon écran
  }

  // calcule
}
// bulles bien 

 
 
class Agent2 {

  float xoff = 0.0;
  float yoff = 0.0;

  float xpos;
  float ypos;
  
  //position du cercle

  Agent2(float x, float y) {
    xoff = random(5);
    yoff = random (5);
    xpos = x;
    ypos = y;
  }

  void display() {
    fill(#F702BB);
    image(imgos, xpos - 15, ypos - 15, 30, 30);
  }

  //dessiner ( ellipse)

  void update() {
    xoff = xoff + 0.01;
    xpos = xpos + (noise(xoff)-0.5) * 4;

    yoff = yoff + 0.01;
    ypos = ypos + (noise(yoff)-0.5) * 4;
    
    //vitesse de déplacement et zone de déplacement , + ou - vite

    if (xpos < -30) {
      xpos = xpos + width + 30;
    }
    if (ypos < -30) {
      ypos = ypos + height + 30;
    }
    if (xpos > width + 30) {
      xpos = xpos + width - 30;
    }
    if (ypos > height + 30) {
      ypos = ypos + height - 30;
    }
    
    // Calcule pour que mes boules passe de l'autre coté de mon écran
  }

  // calcule
}

// bulles mal



class Agent3 {

  float xoff = 0.0;
  float yoff = 0.0;

  float xpos;
  float ypos;
  //position du cercle

  Agent3(float x, float y) {
    xoff = random(5);
    yoff = random (5);
    xpos = x;
    ypos = y;
  }

  void display() {
    fill(#F7FF24);
    image(imgpoulet, xpos - 20, ypos - 16, 40, 34);
  }

  //dessiner ( ellipse)

  void update() {
    xoff = xoff + 0.01;
    xpos = xpos + (noise(xoff)-0.5) * 4;

    yoff = yoff + 0.01;
    ypos = ypos + (noise(yoff)-0.5) * 4;
    
    //vitesse de déplacement et zone de déplacement , + ou - vite

    if (xpos < -30) {
      xpos = xpos + width + 30;
    }
    if (ypos < -30) {
      ypos = ypos + height + 30;
    }
    if (xpos > width + 30) {
      xpos = xpos + width - 30;
    }
    if (ypos > height + 30) {
      ypos = ypos + height - 30;
    }
    
    // Calcule pour que mes boules passe de l'autre coté de mon écran
  }

  // calcule
}

//bulle bonus



class Agent4 {

  float xoff = 0.0;
  float yoff = 0.0;

  float xpos;
  float ypos;
  //position du cercle

  Agent4(float x, float y) {
    xoff = random(5);
    yoff = random (5);
    xpos = x;
    ypos = y;
  }

  void display() {
    fill(#1800FF);
    image(imgmeteorite, xpos - 25, ypos - 15, 50, 31);
  }

  //dessiner ( ellipse)

  void update() {
    xoff = xoff + 0.01;
    xpos = xpos + (noise(xoff)-0.5) * 4;

    yoff = yoff + 0.01;
    ypos = ypos + (noise(yoff)-0.5) * 4;
    
    //vitesse de déplacement et zone de déplacement , + ou - vite

    if (xpos < -30) {
      xpos = xpos + width + 30;
    }
    if (ypos < -30) {
      ypos = ypos + height + 30;
    }
    if (xpos > width + 30) {
      xpos = xpos + width - 30;
    }
    if (ypos > height + 30) {
      ypos = ypos + height - 30;
    }
    
    // Calcule pour que mes boules passe de l'autre coté de mon écran
  }

  // calcule
}

//bulle malus
