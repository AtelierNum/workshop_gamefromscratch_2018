void nextlvl() {
  if (nbeaten>=niveau.get(clvl).nb2pop && clvl<21) {
    clvl++;
  } else if(nbeaten==niveau.get(clvl).nb2pop && clvl==21){
    rectMode(CENTER);
    textSize(50);
    fill(255, 255, 1);
    noStroke();
    image(youwin, width/2, height/2, 400, 400);
    //noLoop();
    
  }
  
  if (vie==0){
    imageMode(CENTER);
    textSize(50);
    fill(255, 255, 1);
    noStroke();
    image(youloose, width/2, height/2, 400, 400);
    //fill(0);
    //text("GAME OVER", 250, 415);
    /*file = new SoundFile(this,"boom.mp3");
    file.play();
    file.amp(0.3);*/
    
  }
}
