class Barre { // creation de la barre a oxegen

  void display (float bar, int greenB, float redB, int timeB,int WaveN) {
    fill (100, 100, 100); 
    stroke (255, 255, 255);
    quad(200, 0, width, 0, width, 70, 100, 70);
    fill (255, 255, 255);
    quad (200, 30, width, 30, width, 55, 250, 55);
    fill (0, 255, 255);
    if (bar<200) { // permet garder la barre a son maximun si on prend trop de boule bleu
      quad (200, 30, width, 30, width, 55, 250, 55);
    } else { 
      if (bar<1300) { // fait diminuer la taille de la barre tout les frame donner ( bar)
        quad (bar, 30, width, 30, width, 55, 50+bar, 55);
      } else {

        fill (255, 0, 0);
        quad (bar, 30, width, 30, width, 55, 50+bar, 55);
      }
    }

    textSize(20); // tout les aspet graphique de la barre a oxygen
    text ("Oxygen", 200, 20);
    fill (50, 50, 50);
    noStroke ();
    quad (180, 30, 230, 60, 200, 60, 135, 60);
    fill (25, 25, 25);
    quad (180, 40, 210, 55, 200, 55, 150, 55);
    stroke (200, 200, 200);
    quad (1000, 70, width, 70, width, 150, 1200, 150);
    strokeWeight (5);
    line (250, 25, 300, 60);
    line (400, 25, 450, 60);
    line (550, 25, 600, 60);
    line (700, 25, 750, 60);
    line (850, 25, 900, 60);
    line (1000, 25, 1050, 60);
    line (1150, 25, 1200, 60);
    line (1300, 25, 1350, 60);
    line (1450, 25, 1500, 60);
    strokeWeight (2);
    line (300, 25, 350, 60);
    line (350, 25, 400, 60);
    line (450, 25, 500, 60);
    line (500, 25, 550, 60);
    line (600, 25, 650, 60);
    line (650, 25, 700, 60);
    line (750, 25, 800, 60);
    line (800, 25, 850, 60);
    line (900, 25, 950, 60);
    line (950, 25, 1000, 60);
    line (1050, 25, 1100, 60);
    line (1100, 25, 1150, 60);
    line (1200, 25, 1250, 60);
    line (1250, 25, 1300, 60);
    line (1350, 25, 1400, 60);
    line (1400, 25, 1450, 60);

    stroke (0, 200, 0);
    strokeWeight (5);
    fill (0, 255, 0);
    ellipse (1200, 100, 25, 25);

    text ("X"+greenB, 1220, 100);

    stroke (200, 0, 0);
    strokeWeight (5);
    fill (255, 0, 0);
    ellipse (1350, 100, 10, 10);

    text ("X"+redB, 1370, 100);

    noStroke(); // afiche les boule rouge et vert stocker
    fill (255, 255, 255);
    quad (1150, 120, width, 120, width, 145, 1200, 145);

    fill (0, 255, 255);
    quad (timeB+2, 122, width, 122, width, 143, 52+timeB, 143);


    fill (0, 0, 0); // barre de temps de la vaugue en cours
    text("Time", 1200, 138);
    text("Wave"+WaveN, 1300,138);
  }
}
