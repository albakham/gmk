SoundFile musique1, crabe, musique_requin;

int cpt=0;
int index=0;
int declencheur = 6000;   //variable pour le déclenchement du combat du boss 

boolean bouger= true ;    

//Images d'ennemis
PImage Irequin;
PImage vague;
PImage projoReq;
PImage requin_normal;
PImage requin_ouch;
PImage[] mechantcrabe= new PImage[24];
PImage[] pastouche = new PImage[6];
PImage spriteSheet;

//Elements de décoration
PImage palmier1,palmier2,palmier3;
PImage petitmaison ;
PImage fauteille,fauteille2;
PImage hamac;
PImage surf;
PImage guitare;

//Plateformes niveau 1
Plateforme rec0 = new Plateforme(0,500,1500,1000);
Plateforme rec1 = new Plateforme(2000,500,1500,1000);
Plateforme rec2 = new Plateforme(4000,500,500,1000);
Plateforme rec3 = new Plateforme(4700,350,110,30);
Plateforme rec4 = new Plateforme(5100,450,110,30);
Plateforme rec5 = new Plateforme(5600,360,110,30);
Plateforme zoneBoss = new Plateforme(6500, 500, 2000,1000); //plateforme du boss
 

//Petits ennemis du niveau 1
crabe mechant = new crabe(2600,500,2600);
crabe mechant2= new crabe(4250,500,4250);
PasTouche pic1= new PasTouche(1300,450);
PasTouche pic11= new PasTouche(4780,350);
PasTouche pic12= new PasTouche(5100,450);

//boss du niveau 1
Boss requin = new Boss(declencheur+1500, 0); //le requin spawn 1500 px après le déclencheur


//Definition du boss du niveau 1 et de ses caractéristique
class Boss {
  int x;
  int y;
  int pvmax=10; //changer cette valeur pour modifier pv du requin
  int pv = pvmax; 
  int pointLePlusBas = 500; //le requin ne va pas plus bas que cela
  int phase=0;
  int xboule=-100;
  int yboule=0;
  boolean mort = false; 
  boolean boule= true;
  int frame; 
  int sprite = 1; //sprite 1 = normal sprite2 = dégât
  int vitess=4;
  int vitesseBoule=30;
  
  Boss(int xboss, int yboss){
    x=xboss;
    y=yboss;
  }
  
  //Affiche le boss
  void drawBoss(){
    image(vague, x+120, y+500);
    image(Irequin, x, y);
  }
  
  void updateBoss(){ //gère les mouvements du boss et le moment où il tire des bdf
    //phase 0 => le requin descend
    if (phase==0 && y<pointLePlusBas){
      y+=vitess; 
    }
    if (phase==0 && y>=pointLePlusBas){
      phase=1;
    }
    if (phase==1 && y>0){
      y-=vitess;    
    }
    if (phase==1 && y<=0){
      phase=0;
    }
    if (y==300){ //shoot la 2e bdf
      boule=true;
      xboule=x;
      yboule=y;
    }
    
    if (y==480 && phase==0){ //shoot la 2e bdf
      boule=true;
      xboule=x;
      yboule=y;
    }
  }
  
  void bdf(){
    if (boule==false){
      yboule=-3000;
    }
    if (xboule >=0 && boule == true){
      xboule -=vitesseBoule;
    }
    if (xboule<0){
       boule=false;
    }
  }
  
  // Teste si le boss est touché et déclenche différentes actions si c'est le cas
  void toucheLeBoss(int xproj, int yproj, int xboss, int yboss){ 
    if (xproj>xboss-50 && xproj<xboss+50 && yproj > yboss-100 && yproj<yboss+150) {
      savate.y=10000;
      bruitSavate.play();
      pv--;
      frame=frameCount;
      sprite=2;
      if (pv==0){  // Si le requin n'a plus de vie, on passe au niveau suivant et certaines variables sont réinitialisées
        musique1.stop();
        musique_requin.stop();
        lvl++;
        cinema=true; actframe = frameCount; playIntroSound=true;
        nbvie=3;
        joueur.x=200;
        joueur.y=0;
        savate.v = 16;
        a_manger.affiche=true;
      }
    }
  }
  
  // // Teste si le joueur est touché et déclenche différentes actions si c'est le cas
  void estToucheParBoss(int xboule, int yboule, int xpers, int ypers){ //teste si le perso prend des dégâts
    if (xboule>xpers && xboule<xpers+50 && yboule>ypers-perso.height/2 && yboule<ypers+perso.height/2 && boule==true) {
      
      boule=false;
      nbvie--; 
    }
  }
  
  void changeSprite(){ //on change le sprite du boss pendant 90 frames qd il est touché
    if (sprite==1){
      Irequin=requin_normal;
    }
    if (sprite==2 && frameCount < frame+90){ 
      Irequin=requin_ouch;
    }
    if (sprite==2 && frameCount>frame+90){
      sprite=1;
    }
    
  }
}


void toutPourLeRequin(){
  requin.drawBoss();   // affiche le requin
  image(projoReq, requin.xboule, requin.yboule); //dessiner le sprite de la bdf du requin
  requin.updateBoss(); //les déplacements
  requin.bdf(); //gestion bdf
  requin.toucheLeBoss(savate.x, savate.y, requin.x, requin.y); //teste si le requin se fait toucher
  requin.estToucheParBoss(requin.xboule, requin.yboule, joueur.x, joueur.y); //teste si le requin touche le joueur
  requin.changeSprite(); //change le sprite qd le requin prend un coup
}



// Définition de l'ennemi crabe
class crabe {
  
  int xspeed; 
  int xdirection;  
  int vie;
  int x;
  int y;
  int r;
 
  crabe(int abs, int ord,int xdepart) {
    x = abs;
    y = ord;
    r=xdepart;
    
    xspeed = 2; 
    xdirection = 1;  
    vie =1;
  }
  
  void afficher(){
    image(mechantcrabe[index+(cpt%23)], x, y);
  }

  void moove(){
   
    x = x + ( xspeed * xdirection );
    if (x > (r+200) || (x < r-200)) {
      xdirection *= -1;
    }
  }
  
  void imageanimation(){ 
    spriteSheet = loadImage("item/interaction/crabe1.png");
    for (int x = 0; x < 24; x++){
      mechantcrabe[x] = spriteSheet.get(x*131, 0, 131 , 129);
    }
  }
  

  void physiqueCrabe(){
    if (abs(joueur.x-x) <= (spriteSheet.width/24)-50 && abs(joueur.y-y) <= spriteSheet.height) {
      nbvie--;
      crabe.play();
      joueur.y -= 100;
      if (joueur.x <= x) joueur.x -= 200;
      else joueur.x += 200;
      perso = perso_saute;
    }
    
    if (abs(savate.x-x) <= (spriteSheet.width/24)-50 && abs(savate.y-y) <= spriteSheet.height){
      vie--;
      bruitSavate.play();
      savate.y = 10000;
    }   
  }
  
  void toutpourleCrabe(){
    if (vie>0){
      afficher();
      moove();
      cpt++;
      physiqueCrabe();
    }
  }
}
