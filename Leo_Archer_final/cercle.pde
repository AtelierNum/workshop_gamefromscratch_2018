     class Cercle {
    
    float x = 0; //définition de la varfiable x
   float y = 0;
 
 void update(){       //fonction bouger
     x = lerp(x , mouseX, 0.20);
    y = lerp(y,mouseY, 0.20);
    }
    
    void display(){        //fonction se dessiner
 
 image(img3,x,y,60,60);
  /* stroke(#36B3FF);
   strokeWeight(3);
    noFill();
    ellipse(x,y, 60,60); // cercle créé ayant comme position de création les variables  */
 }
} 
 
