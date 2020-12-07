//Cet onglet concerne le niveau 3 (descente au fond du volcan)

SoundFile musique3;

int hp = 30; //épaisseur des plateformes du niveau 3

PImage samoussa1;
PImage samoussa2;
PImage samoussa;


//Plateformes niveau 3
Plateforme mur1 = new Plateforme(-100,-300,300,10000);
Plateforme mur2 = new Plateforme(1000,-300,300,10000);
Plateforme mur3 = new Plateforme(0,6500,500,10000);
Plateforme mur4 = new Plateforme(700,6500,500,1000);
Plateforme p1 = new Plateforme(180,400,420,hp);
Plateforme p2 = new Plateforme(400,800,400,hp);
Plateforme p3 = new Plateforme(100,1200,400,hp);
Plateforme p4 = new Plateforme(500,1600,600,hp);
Plateforme p5 = new Plateforme(400,2000,300,hp);
Plateforme p6 = new Plateforme(180,2400,420,hp);
Plateforme p7 = new Plateforme(400,2800,400,hp);
Plateforme p8 = new Plateforme(100,3200,400,hp);
Plateforme p9 = new Plateforme(500,3600,600,hp);
Plateforme p10 = new Plateforme(400,4000,300,hp);
Plateforme p11 = new Plateforme(180,4400,420,hp);
Plateforme p12 = new Plateforme(400,4800,400,hp);
Plateforme p13 = new Plateforme(100,5200,400,hp);
Plateforme p14 = new Plateforme(500,5600,600,hp);
Plateforme p15 = new Plateforme(400,6000,300,hp);



class Samoussa {
  int x;
  int y;
  int d;
  int v;
  int i;
  int vie;
  
  Samoussa(int abs,int ord,int vit){
    x = abs;
    y = ord;
    v = vit;
    d = 360/v;
    i = 0;
    vie = 1;
  }
  
  void physique(){
    if (vie>0){
      image(samoussa,x,y);
      if (abs(joueur.x-x) <= samoussa.width/2 && abs(joueur.y+50-y) <= samoussa.height) {
        nbvie--;
        cri.play();
        joueur.y -= 100;
        perso = perso_saute;
      }
      if (abs(savate.x-x) <= 50 && abs(savate.y-y) <= 50){
        bruitSavate.play();
        vie--;
        savate.x = 10000;
      }
      deplace();
    }
  }
  
  void deplace(){
    x += v;
    i++;
    if(i == d){
      v *= (-1);
      i=0;
    }
    
    if (frameCount%20 < 10) samoussa = samoussa1; // Animation du samoussa
    else samoussa = samoussa2;
  }
}


//Ennemis du niveau
PasTouche lave1 = new PasTouche(p2.x+300,p2.y);
PasTouche lave2 = new PasTouche(p3.x+300,p3.y);
PasTouche lave3 = new PasTouche(p5.x+100,p5.y);
PasTouche lave4 = new PasTouche(p6.x+150,p6.y);
PasTouche lave5 = new PasTouche(p10.x+100,p10.y);
PasTouche lave6 = new PasTouche(p13.x+300,p13.y);

Samoussa sam1 = new Samoussa(p4.x+50,p4.y-30,2);
Samoussa sam2 = new Samoussa(p7.x+50,p7.y-30,2);
Samoussa sam3 = new Samoussa(p9.x+50,p9.y-30,3);
Samoussa sam4 = new Samoussa(p11.x+50,p11.y-30,3);
Samoussa sam5 = new Samoussa(p12.x+50,p12.y-30,5);
Samoussa sam6 = new Samoussa(p14.x+50,p14.y-30,5);
Samoussa sam7 = new Samoussa(mur3.x+150,mur3.y-30,5); Samoussa sam8 = new Samoussa(mur4.x,mur3.y-30,5);

void all_plateforme(){//active la physique de toutes les plateformes
  p1.physique(joueur.x);
  p2.physique(joueur.x);
  p3.physique(joueur.x);
  p4.physique(joueur.x);
  p5.physique(joueur.x);
  p6.physique(joueur.x);
  p7.physique(joueur.x);
  p8.physique(joueur.x);
  p9.physique(joueur.x);
  p10.physique(joueur.x);
  p11.physique(joueur.x);
  p12.physique(joueur.x);
  p13.physique(joueur.x);
  p14.physique(joueur.x);
  p15.physique(joueur.x);
  mur3.physique(joueur.x);
  mur4.physique(joueur.x);
  mur1.physique(joueur.x);
  mur2.physique(joueur.x);
}

void all_mal(){ //Active tous les ennemis
  lave1.physique();
  lave2.physique();
  lave3.physique();
  lave4.physique();
  lave5.physique();
  lave6.physique();
  sam1.physique();
  sam2.physique();
  sam3.physique();
  sam4.physique();
  sam5.physique();
  sam6.physique(); 
  sam7.physique(); 
  sam8.physique();
}
