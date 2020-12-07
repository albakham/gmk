PImage[] decor = new PImage[5];

//Background dynamique
void affiche_decor(int n){
  if(nbvie>=0 && lvl < 3){
    float decale_decor = (frameCount/5)%decor[n].width;
    imageMode(CORNER);
    image(decor[n],0-decale_decor,0);
    image(decor[n],decor[n].width-decale_decor,0);
    imageMode(CENTER);
  }
  if(lvl == 3){
    imageMode(CORNER);
    image(decor[n],0,-200);
    imageMode(CENTER);
  }
  if(lvl == 4){
    imageMode(CORNER);
    image(decor[n],0,0);
    imageMode(CENTER);
  }
}


//Scrolling
void scroller(int n){
  if (n == 1) {
    if (joueur.x >= 300 && joueur.x < zoneBoss.x) translate(300-joueur.x,50); //scrolling global
    else if (joueur.x >= zoneBoss.x) {  //scrolling zone du requin
      translate(-zoneBoss.x,50);
      if (abs(joueur.x-zoneBoss.x) <= 40) joueur.x = (zoneBoss.x+40);
      if (abs(joueur.x-(zoneBoss.x+width-300)) <= 10) joueur.x = (zoneBoss.x+width-310);
    }
    else if (joueur.x<300) translate(0,50);
  
    if (joueur.x < 50) joueur.x=50; //bloque le joueur au début
  }
  if (n == 2) {
    if (joueur.x >= 300 && joueur.x < zoneBoss.x) translate(300-joueur.x,50); //scrolling global
    else if (joueur.x >= zoneBoss.x) {  //scrolling zone du boss
      translate(-zoneBoss.x,50);
      if (abs(joueur.x-zoneBoss.x) <= 40) joueur.x = (zoneBoss.x+40);
      if (abs(joueur.x-(zoneBoss.x+width-30)) <= 10) joueur.x = (zoneBoss.x+width-31);
    }
    else if (joueur.x<300) translate(0,50);
  
    if (joueur.x < 50) joueur.x=50; //bloque le joueur au début
  }
  
  if (n == 3) {
    translate(0,height/2-joueur.y-10);  //change la "hauteur" du joueur dans le niveau 3 
  }
}
