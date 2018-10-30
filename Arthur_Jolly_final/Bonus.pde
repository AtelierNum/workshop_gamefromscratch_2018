class bonus {


  float xoff = 0.0;
  float yoff = 0.5;
  float xpo;
  float ypo;


  bonus(float x, float y) {

    xpo = x;
    ypo = y ;
    xoff = random(2);
    yoff = random(2);
  }
  void display() {
    fill(242);
    image(vifd, xpo, ypo, 18, 18);

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
