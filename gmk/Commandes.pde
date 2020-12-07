int direction=0;    //Variable qui enregistre la dernière direction vers laquelle le joueur est parti (droite/gauche) afin de lancer la savate dans ce même sens

Boolean afficheTuto=true;
Boolean tutoAvancer = true;
Boolean tutoLancer = true;
Boolean tutoSauter = true;
Boolean tutoReculer = true;
Boolean tutoBaisser = true;

PImage avancer,sauter,reculer,lancer,baisser;    //Icones du tutoriel

void keyPressed(){
  //Commandes de déplacement
  if (keyCode == RIGHT) {
    if (perso != perso_assis) {
      moveX = vit;
      perso = perso_courtd;
      direction=0;
    }
    if(lvl==1 && cinema == false){
      tutoAvancer=false;
    }
  }
  if (keyCode == LEFT) {
    if (perso != perso_assis) {
      moveX = -vit;
      perso = perso_courtg;
      direction=1;
    }
    if(lvl==1 && cinema == false){
      tutoReculer=false;
    }
  }
  if (keyCode == UP) {
    if (njump == 0) {
      perso = perso_saute;
      fjump = frameCount;
      njump++;
    }   
    if(lvl==1 && cinema == false){
      tutoSauter=false;
    }
  }
  if (keyCode == DOWN) {
    if (perso != perso_assis) perso = perso_assis;
    if(lvl==1 && cinema == false){
      tutoBaisser=false;
    }
  }
  
  //Lancée du projectile
  if (keyCode == 'W') {
    if (savate.i <= savate.delai) return;
    savate.x = joueur.x;
    savate.y = joueur.y;
    savate.i = 0;
    
    if (direction == 1) savate.v = -abs(savate.v);
    else savate.v = abs(savate.v);
    if(lvl==1 && cinema == false){
      tutoLancer=false;
    }
  }
  
  //Rejouer (cas d'un game over)
  if(keyCode==32 && nbvie==0){
    reinitialisation(lvl);
  }
  
  //passer la cinématique
  if (keyCode=='A' && lvl>0){
    cinema=false; 
    replik[lvl][ncine].stop();
  }
}

void keyReleased(){ //Quand une touche est relaché
  if (keyCode == RIGHT) {
    moveX = 0;
    if (perso != perso_assis) perso = perso_neutre;
  }
  
  if (keyCode == LEFT) {
    moveX = 0;
    if (perso != perso_assis) perso = perso_neutreg;
  }
  
  if (keyCode == DOWN) {
    joueur.y -= 50;
    perso = perso_neutre;
  }
}

//tutoriel qui est affiché au début du niveau 1
void tuto(){
  if(joueur.x>width*3)afficheTuto=false;
  if(cinema==false){
    if(tutoAvancer && afficheTuto==true){
      image(avancer,950,150);
    }
    if(tutoLancer && afficheTuto==true){
      image(lancer,1100,150);
    }
    if(tutoBaisser && afficheTuto==true){
      image(baisser,950-115-10,150);
    }
    if(tutoSauter && afficheTuto==true){
      image(sauter,950-115-10,50);
    }
    if(tutoReculer && afficheTuto==true){
      image(reculer,950-230-20,150);
    }
  }
}
