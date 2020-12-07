SoundFile musique2;
SoundFile musique_araignee, bruitMonstre;

PImage liane;
PImage pdanger;
PImage fondlvl2;
PImage petitliane1;
PImage lianeseul;
PImage herbe;
PImage pfleche,ptomber;

PImage araignee_rage;
PImage Iaraignee;
PImage araignee_normale;
PImage araignee_ouch;
PImage projoAr;
PImage mechantangue;

//Plateformes niveau 2
Plateforme rec0lvl2 = new Plateforme(0,500,1000,500);
Plateforme hauteur1 = new Plateforme(1200,300,250,50);
Plateforme hauteur2 = new Plateforme(1600,200,250,50);
Plateforme hauteur3 = new Plateforme(2500,500,80,50);
Plateforme hauteur4 = new Plateforme(2700,500,2300,500);
Plateforme hauteur5= new Plateforme(5000,400,300,30);
Plateforme hauteur6= new Plateforme(2400,150,85,30);
Plateforme hauteur7= new Plateforme(3000,150,85,30);
Plateforme hauteur8= new Plateforme(3730,150,90,30);
Plateforme hauteur9= new Plateforme(4400,150,80,30);
Plateforme hauteur9aide= new Plateforme(4650,120,60,70);
Plateforme hauteur10= new Plateforme(5100,-90,150,40);//platforme caché 
Plateforme zoneBoss2 = new Plateforme(5850, 500, 2000,1000); //plateforme du boss

//Petits ennemis du niveau 2
tangue tangue1 = new tangue(3700,500,90);
tangue tangue2 = new tangue(5000,500,90);
PasTouche pic = new PasTouche(3000,480);
PasTouche pic2 = new PasTouche(1300,450);
PasTouche liquide1= new PasTouche(5150,430);

//boss du niveau 2
Boss2 araignee = new Boss2(declencheur+1500, 0);

class Boss2 {
  int x;
  int y;
  int vitessemin = 6;
  int vitesse = vitessemin;
  int pvmax=10; //changer cette valeur pour changer les pv de l'araignee
  int pv=pvmax;
  int pointLePlusAGauche = declencheur+600;
  int pointLePlusADroite = declencheur+1600;
  int xboule=0;
  int yboule = -100;
  PImage projoAr;
  boolean phaseVersGauche = true;
  boolean boule = false;
  int frame;
  int frame2;
  int sprite=1;
  boolean rage = false;
  Boss2(int xboss2, int yboss2) {
    x=xboss2;
    y=yboss2;
  }

  void updateBoss2() {
    if (phaseVersGauche==true && x>pointLePlusAGauche) x-=vitesse;
    if (phaseVersGauche==true && x<=pointLePlusAGauche) phaseVersGauche=false;
    if (phaseVersGauche==false && x<pointLePlusADroite) x+=vitesse;
    if (phaseVersGauche==false && x>=pointLePlusADroite) phaseVersGauche=true;
    if (x<joueur.x && x+100>joueur.x && frameCount>frame+40 && phaseVersGauche==false) { //peut lancer une bdf toutes les 40 frames
      frame=frameCount;
      boule=true;
      xboule=joueur.x;
      yboule=y;
    }
    if (x>joueur.x && x-100<joueur.x && frameCount>frame+40 && phaseVersGauche==true) { //pas un doublon de celui du dessus !
      frame=frameCount;
      boule=true;
      xboule=joueur.x;
      yboule=y;
    }
  }
  void toucheLeBoss(int xproj, int yproj, int xboss, int yboss) { //teste si le boss prend des dégâts
    if (xproj>xboss-50 && xproj<xboss+50 && yproj > yboss-100 && yproj<yboss+150) {
      savate.y=10000;
      bruitSavate.play();
      pv--;
      frame=frameCount;
      sprite=2;
      if (pv==pvmax/2) {
        vitesse=vitesse*2;
        rage=true;
      }
      if (pv==0) {
        nbvie=3;
        musique_araignee.stop();
        savate.v = 16;
        lvl++;
        
        musique2.stop();
        savate.phase=0;
        joueur.x=200;
        joueur.y=0;
        a_manger.affiche=true;
      }
    }
  }
  void estToucheParBoss(int xboule, int yboule, int xpers, int ypers) { //teste si le perso prend des dégâts
    if (xboule>xpers-perso.width/2 && xboule<xpers+perso.width/2 && yboule>ypers-perso.height && yboule<ypers+perso.height && boule==true) {
      boule=false;
      nbvie--;
    }
  }
  void bdf() {
    if (boule==false) { //si boule est false, on sort la boule de l'écran
      yboule=-150;
    }
    if (boule==true && yboule>600) boule=false; //si la boule a fini son trajet

    if (yboule>=0 && boule==true) {
      yboule+=18; //déplacement normal
    }
  }
  void changeSprite(){
    if (sprite==1){
      Iaraignee=araignee_normale;
    }
    if (sprite==2 && frameCount < frame+30){ 
      Iaraignee=araignee_ouch;
    }
    if (sprite==2 && frameCount>frame+30 && rage==false){
      sprite=1;
      Iaraignee=araignee_normale;
    }
    if (sprite==2 && frameCount>frame+30 && rage==true){
      sprite=3;
      Iaraignee=araignee_rage;
    }
  }
}


void toutPourAraignee() {
  image(Iaraignee, araignee.x, araignee.y);
  image(projoAr, araignee.xboule, araignee.yboule);
  image(Iaraignee, araignee.x, araignee.y);
  araignee.updateBoss2();
  araignee.bdf();
  araignee.toucheLeBoss(savate.x, savate.y, araignee.x, araignee.y);
  araignee.estToucheParBoss(araignee.xboule, araignee.yboule, joueur.x, joueur.y);
  araignee.changeSprite();
  if(frameCount%300==0){
    bruitMonstre.play();
  }
}

class tangue {
  
  int xspeed; 
  int xdirection;  
  int vie;
  int x;
  int y;
  int r;
 
  tangue(int abs, int ord,int rad) {
    x = abs;
    y = ord;
    r = rad;
    xspeed = 7; 
    xdirection = 1;  
    vie =1;
  }
  

  void moove(){
   
 
  if(x>joueur.x){
    if(  x>=hauteur4.x && x-joueur.x<800){
      x -=1*xspeed;
    }
  }
  if(x<joueur.x){
    if( x<=(hauteur4.x+2200) && joueur.x-x<800){
      x +=1*xspeed;}
    }  
  }

  void physiqueTangue(){
    if (abs(joueur.x-x) <= (mechantangue.width)-50 && abs(joueur.y-y) <= mechantangue.height) {
      nbvie--;
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
  
  void toutpourleTangue(){
    if (vie>0){
      image(mechantangue, x, y);
      moove();
      physiqueTangue();
    }
  }
}
