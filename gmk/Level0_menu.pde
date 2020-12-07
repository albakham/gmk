PImage menu;
PFont police;

SoundFile intro;

boolean clignotement;
int xbtn =670 ;
int ybtn=400;
int xbtn2=670;
int ybtn2=550;
     
void menu(){
   image(menu,width/2,height/2);
   //Pour le premier bouton   
   fill(#38040C);
   rect(xbtn,ybtn,400,100);
   stroke(56,88,152,1);
   fill(#ffffff);
   police = loadFont("DejaVuSansCondensed-BoldOblique-48.vlw");
   textFont(police,48);
   text("Jouer",xbtn,ybtn+20,400,220);
   textAlign(CENTER);
   textSize(60);
     
   //Pour le deuxième bouton 
   fill(#38040C);
   rect(xbtn2,ybtn2,400,80);
   stroke(56,88,152,1);
   fill(#B9121B);
   police = loadFont("DejaVuSansCondensed-BoldOblique-48.vlw");
   textFont(police,48);
   text("Quitter",xbtn2,ybtn2+15,400,220);
   textAlign(CENTER);
   textSize(60);
   
   //Pour le bouton jouer
    if (mouseX > xbtn && mouseX < xbtn+400 && mouseY > ybtn && mouseY < ybtn+100){
      cursor(HAND);
    //Pour le bouton quitter
    } else if (mouseX > xbtn2 && mouseX < xbtn2+400 && mouseY > ybtn2 && mouseY < ybtn2+80){
      cursor(HAND);
    } else{
       cursor(ARROW);
    }
}

void mouseClicked(){   //Détecte le clic de l'utilisateur
  if (lvl==0){
    //Bouton jouer
    if (mouseButton == LEFT || mouseButton == RIGHT){
      if (mouseX > xbtn && mouseX < xbtn+400 && mouseY > ybtn && mouseY < ybtn+100) {
        lvl++;
        cursor(ARROW);
        intro.stop();
        textAlign(CORNER);
        actframe=frameCount;
      }
    }
  
    //Bouton quitter le jeu
    if (mouseButton == LEFT || mouseButton == RIGHT){
      if (mouseX > xbtn2 && mouseX < xbtn2+400 && mouseY > ybtn2 && mouseY < ybtn2+80) exit(); //lvl++;
    }
  }
}
