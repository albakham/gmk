SoundFile cri;
SoundFile manger;
SoundFile boire;
SoundFile bruitSavate;

Perso joueur = new Perso(500,200);  //le joueur débute a la coordonées(500,200)
Pain_bouchon a_manger = new Pain_bouchon(5800,250); //Pains bouchons qui rendent une vie au joueur
Cot toc1 = new Cot(3300,480); //Bouteille de Cot: Améliore les capacités du personnage.
Cot toc2 = new Cot(5050,-100);
Projo savate = new Projo();

int vit=10; 
int moveX=0; 
int moveY=0;
int nbvie = 3;
int nbvieTest = nbvie;
int fjump=-200;
int njump=0;

PImage perso, perso_neutre, perso_neutreg, perso_courtd, perso_courtd2, perso_courtg, perso_courtg2, perso_saute, perso_assis;  //Les images des différentes positions du personnage
PImage vie;
PImage aura;
PImage pain_bouchon;
PImage cot;
PImage savat2doi;


// Definition du personnage
class Perso {
  int x;
  int y;
  int v;
  
  Perso(int abs, int ord) {
    x = abs;
    y = ord;
    v = 10;
  }
  
  void afficher(){
    fill(220,20,220);
    image(perso,x,y);
    
    if (nbvieTest != nbvie){
      if (nbvieTest > nbvie) cri.play();
      nbvieTest = nbvie;
    }
  }
  
  void deplacer(){
    x += moveX;
    y += G;
    if (frameCount - fjump <= 10) y -= 25;
  }
  
  void update(){
    anime_course();
    afficher();
    deplacer();
    
  }
  
}

// Definition du pain bouchon qui rend de la vie
class Pain_bouchon {
  int x;
  int y;
  Boolean affiche;
  
  Pain_bouchon(int abs,int ord){
    x = abs;
    y = ord;
    affiche=true;
  }
  
  void afficher(){
    if(lvl==1 && affiche==true){
      x=5800; y=250;
      image(pain_bouchon,x,y);
    }
    if(lvl==2 && affiche==true){
      x = 3500; y = 250;
      image(pain_bouchon,x,y);     
    }
    if(lvl==3 && affiche==true){
      x = 400; y = 3000;
      image(pain_bouchon,x,y);
    }
  }
  
  void physique(){
    if (abs(joueur.x-x) <= pain_bouchon.width/2 && abs(joueur.y+50-y) <= pain_bouchon.height) {
      if(nbvie<3){
        nbvie++;
        manger.play();
        if(lvl==3){
          x=10000;
          affiche=false;
        }
        else{
          y=10000;
          affiche=false;
        }
      }
    }
  }
}

// Definition du cot qui ameliore les stats du perso
class Cot {
  int x;
  int y;
  int horas=0;
  int frame_recup=100000;
  int delai = 2000;
  
  Cot(int abs,int ord){
    x = abs;
    y = ord;
  }
  
  void physique(){
    image(cot,x,y);
    if (horas == 1) image(aura,joueur.x,joueur.y-40);
    if (abs(joueur.x-x) <= cot.width && abs(joueur.y+50-y) <= cot.height) {
      horas = 1;
      savate.v *= 2;
      savate.delai /= 2;
      vit*=2;
      y = -10000;
      boire.play();
      frame_recup = frameCount;
    }
    
    if (frameCount-frame_recup == delai && horas == 1) {
      horas = 0;
      savate.v /= 2;
      savate.delai *= 2;
      vit/=2;
    }
  }
}

// Définition de la savate que lance le personnage
class Projo {
  int x;
  int y;
  int v;
  int i;
  int delai;
  int phase = 0;
  
  Projo(){
    x = -200;
    y = 10000;
    v=16;
    i=0;
    delai=40;
  }
  
  void lancer(){
    if (phase==0){
      x += v;
      y += abs(v)*i/200;
    }
    else if (phase==1){ //lance les savates vers le haut                 
      y-=abs(v);              
      x += abs(v)*i/200;
      image(savat2doi,x,y);
      i++;
      return;
    }
    image(savat2doi,x,y);
    i++;
  }
}

// Définiton des objets statiques dangereux pour le perso
class PasTouche {
  int x;
  int y;
  
  PasTouche(int abs,int ord){
    x = abs;
    y = ord;
  }
  
  void physique2(){
    
    image(pastouche[5],x,y);
  if (abs(joueur.x-x) <= pastouche[5].width/2 && abs(joueur.y-5-y) <= pastouche[5].height+10) {
    vit=5;
  } 
  else{vit=10;}
}
  
  void physique(){
    
    image(pastouche[lvl],x,y);
    if (abs(joueur.x-x) <= pastouche[lvl].width/2 && abs(joueur.y+50-y) <= pastouche[lvl].height) {
      nbvie--;
      joueur.y -= 100;
      if (joueur.x <= x) joueur.x -= 200;
      else joueur.x += 200;
      perso = perso_saute;
    }
  }  
}


// Animationc de course 
void anime_course(){
  if (keyPressed == true) {   
    if (keyCode == RIGHT && perso != perso_assis) {
      if (frameCount%40 < 20){
        perso = perso_courtd;
      }
      if (frameCount%40 >= 20){
        perso = perso_courtd2;
      }
    }    
    if (keyCode == LEFT && perso != perso_assis) {
      if (frameCount%40 < 20){
        perso = perso_courtg;
      }
      if (frameCount%40 >= 20){
        perso = perso_courtg2;
      }
    }
  }
}


//Affiche le nombre de vie du personnage
void ath(){
  fill(0,0,0);
  if (lvl != 3){
    for (int i=0; i<nbvie ;i++ ){
      image(vie,40+i*40,40);    
    }
  }
  else {
    for (int i=0; i<nbvie ;i++ ){
      image(vie,40+i*40,joueur.y-275);    
    }
  }
}


/*La fonction réinitialisation prend en entrée le niveau(lvl) et réalise la réinitialisation de plusieurs variables
selon le niveau lorsque le joueur recommence le niveau après un game over ou si le jeu est terminé*/
void reinitialisation(int lvl){
  switch(lvl){
    case 0:
      intro.play();
      redoLvl1();
      redoLvl2();
      redoLvl3();
      redoLvl4();
      
    case 1:
      redoLvl1();
      break;
     
    case 2:
      redoLvl2();
      break;
      
    case 3:
      redoLvl3();
      break;
      
    case 4:
      redoLvl4();
      break;
      
  }
}

void redoLvl1(){
  afficheTuto=true; 
  tutoAvancer = true;
  tutoLancer = true;
  tutoSauter = true;
  tutoReculer = true;
  tutoBaisser = true;
  isPlaying1 = false;
  nbvie=3;
  mechant.vie =1;
  requin.pv = requin.pvmax;
  joueur.x=500;
  joueur.y=200;
  textSize(10);
  a_manger.affiche=true;
  a_manger.afficher();
  a_manger.physique();
  toc1.y=480;
  toc1.horas=0;
  vit=10;
  savate.v = 16;
  savate.delai = 40;
  isPlayingboss1=false;
}

void redoLvl2(){
  isPlaying2 = false;
  nbvie=3;
  tangue1.vie=1;
  tangue2.vie=1;
  tangue1.x=3700;
  tangue1.y=500;
  tangue2.x=5000;
  tangue2.y=500;
  joueur.x=500;
  joueur.y=200;
  araignee.pv=araignee.pvmax;
  araignee.rage=false;
  araignee.vitesse=araignee.vitessemin;
  araignee.sprite=1;
  savate.phase=0;
  savate.v = 16;
  a_manger.affiche=true;
  a_manger.afficher();
  a_manger.physique();
}


void redoLvl3(){
  isPlaying3 = false;
  nbvie=3;
  joueur.x=500;
  joueur.y=200;
  sam1.vie = 1;
  sam2.vie = 1;
  sam3.vie = 1;
  sam4.vie = 1;
  sam5.vie = 1;
  sam6.vie = 1;
  sam7.vie = 1;
  sam8.vie = 1;
  a_manger.affiche=true;
  a_manger.afficher();
  a_manger.physique();
  savate.phase=0;
}

void redoLvl4(){
  nbvie=3;
  joueur.x=500;
  joueur.y=200;
  kal.pv = 9;
  kal.delai = 80;
  gmk = gmknormal;
}
