SoundFile screamer, ricanement, cridouleur;

PImage gmknormal, gmkbobo;
PImage gmk;
PImage rectVie;
PImage sphere; PImage laser;
PImage finjeu;

//Plateforme niveau 4
Plateforme sol = new Plateforme(-100,600,2000,500);

//Boss niveau 4
Gmk kal = new Gmk();

class Gmk {
  int x; int xsort1; int xsort2; int xsort3;
  int y; int ysort1; int ysort2;
  int pv;
  int v1; int v2;
  int frame;
  int delai;
  int pos;
  int framefin;
  
  Gmk() {
    x = 1100;
    y = 500;
    pv = 9;
    
    xsort1 = 10000; xsort2 = 10000; xsort3 = 10000;
    ysort1 = 500; ysort2 = 1500;
    v1 = 10; 
    v2 = 5;

    frame = 0;
    pos = 0;
    delai = 80;
    framefin = 0;
  }
  
  
  void affiche(){ //affichage et téléportation
    frame++;
    if (frame > delai){
      int posini = pos;
      while (pos == posini) pos = int(random(0,4));
      x = 1100-1000*(pos%2);
      if (pos<2) y = 500;
      else y = 200;
      gmk = gmknormal;
      
      frame = 0;
    }
    image(gmk, x, y);
  }
  
  void collision(){
    if (joueur.x < 50) joueur.x=50; //Bloque le joueur à gauche
    if (joueur.x > 1150) joueur.x=1150; //Bloque le joueur à droite
    
    if (abs(joueur.x-x) <= gmk.width/2 && abs(joueur.y-y) <= gmk.height/2+perso.height/2) { // collision avec le joueur
      nbvie--;
      joueur.y -= 100;
      if (joueur.x >= 600) joueur.x -= 200;
      else joueur.x += 200;
      perso = perso_saute;
    }
    
    if (abs(savate.x-x) <= gmk.width/2 && abs(savate.y-y) <= gmk.height/2) { // Touché par la savate
      if (gmk == gmknormal){
        bruitSavate.play();
        pv--;
        if (pv==3) delai*=0.7;
        savate.y = 10000;
        
        gmk = gmkbobo; //changer sprite
        cridouleur.play();
        frame = 0;
      }
    }
  }
  
  void lancer_sort(){
    if (gmk == gmknormal && frame == 20) {
      if (pos == 0){
        xsort1 = x;
      }
      else if (pos == 1){
        xsort2 = x;
      }
      else if (pos > 1 && ysort2 > 600){
        xsort3 = x;
        ysort2 = y;
        v2 = (joueur.x-x)/35;
      }
    }
    xsort1 -= v1;
    xsort2 += v1;
    xsort3 += v2;
    ysort2 += v1;
    
    image(laser,xsort1,ysort1);
    image(laser,xsort2,ysort1);
    image(sphere,xsort3,ysort2);

  }
  
  void ricanement(){
    if(frameCount%300==0) ricanement.play();
  }
  
  void degat_sort(){
    if (abs(joueur.x-xsort1) <= laser.width-50 && abs(joueur.y-ysort1) <= laser.height/2+perso.height/2) { // Degat du laser
      nbvie--;
      xsort1 = 100000;
    }
    if (abs(joueur.x-xsort2) <= laser.width-50 && abs(joueur.y-ysort1) <= laser.height/2+perso.height/2) { // Degat du laser
      nbvie--;
      xsort2 = 100000;
    }
    if (abs(joueur.x-xsort3) <= 20 && abs(joueur.y-ysort2) <= 50) { // Degat du laser
      nbvie--;
      xsort3 = 100000;
    }
    
  }
  
    void ath(){
      for (int i=0;i<pv;i++){
        fill(200,10,10);
        noStroke();
        rect(1100-50*i,30,50,20);
    }
  }
}


void toutPourgmk() {
  sol.physique(joueur.x);
  if (kal.pv > 0){
    kal.affiche();
    kal.collision();
    kal.lancer_sort();
    kal.degat_sort();
    kal.ath();
    kal.ricanement();
    kal.framefin = frameCount;
  }
  else {
    image(finjeu,width/2,height/2);
  }
}
