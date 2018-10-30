void Menu(){//menu principal
   t+=1;
  float T=map(noise(t), 0, 1, 25, 160);
  background(0, 0, T);
  image(fond,0,0,width,height);//noir transparent
if (mouseX<width/2+400 && mouseX>width/2-400 && mouseY<height/2+150 && mouseY>height/2-150) {
    fill(255,100);// si la souris passe sur le bouton play alors surbrillance
    if(mousePressed){
      currentLvl++;//si on presse la souris alors 
    }
  } else {
    fill(255, 50);
  }
  noStroke();
  rectMode(CENTER);
  rect(width/2, height/2, 800, 300, 10);//bouton play
  fill(0, 0, T);
  textSize(200);
  textAlign(CENTER, CENTER);
  fill(255);
  text("PLAY", width/2, height/2-30);
  fill(255);
  rectMode(CORNER);
}
