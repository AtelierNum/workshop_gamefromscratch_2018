
  

class malus{

  
  float xoff = 0.0;
  float yoff = 0.5;
  float xpo;
  float ypo;


  malus(float x, float y) {

    xpo = x;
    ypo = y ;
    xoff = random(2);
    yoff = random(2);
  }
  void display() {
    fill(66,6,0);
    image(kappa,xpo, ypo, 100, 100);

    if (xpo - 30 >width) {
      xpo = xpo + ( width + 30);
    }
    if ( xpo + 30 < 0 ) {
      xpo = xpo + ( width + 30);
    }
    if (ypo - 30 > height) {
      ypo = ypo + (height+ 30);
    }
    if ( ypo + 30 < 0 ) {
      ypo = ypo + ( height + 30);// permet quand un agent sort de l’écran, il réapparait à l’opposé !
    }
  }
  void update() {
    xoff = xoff + 0.01;
    xpo = xpo + (noise(xoff)-0.5) * 4;
    yoff = yoff +0.01;
    ypo = ypo+ (noise(yoff)-0.5) * 4;
  }
}
