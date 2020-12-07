// Importation des librairies
import processing.sound.*;

int lvl=0;  //niveau
int G=7; //constante de gravité

Boolean isPlaying1=false, isPlaying2=false, isPlaying3=false, isPlayingboss1=false, isPlayingboss2=false;


void setup(){
  size(1200,700);
  imageMode(CENTER);
  noStroke();
  mechant.imageanimation();
  def_son();
  def_image();  //appel à la fonction def_image() dans laquelle toutes les images sont définies
  if (lvl==0) intro.play();
  
}

void draw(){ 
  //Niveau 0, c'est-à-dire le menu du jeu
  if(lvl==0){
    menu();
  }
  
  //NIVEAU 1
  if(lvl == 1) {
    if (cinema == false){
      affiche_decor(lvl);  //un décor différent est affiché selon le niveau
      if(joueur.y>700) nbvie=0;   //Si le personnage tombe en dessous de cette coordonée, il meurt
      ath();  //Affichage du nombre de vies
      if(nbvie>0){ 
        tuto(); 
        scroller(lvl);    
        rec0.physique(joueur.x);
        rec1.physique(joueur.x);
        rec2.physique(joueur.x);
        rec3.physique(joueur.x);
        rec4.physique(joueur.x);
        rec5.physique(joueur.x);
        zoneBoss.physique(joueur.x);  
        savate.lancer();       
        a_manger.afficher();
        a_manger.physique();
        toc1.physique();
        image(palmier1,300,350);
        image(petitmaison,600,350);
        image(fauteille,1300,430);
        image(palmier3,2300,350);
        image(palmier2,2600,390);
        image(surf,3000,410);
        image(fauteille2,3150,390);
        image(palmier1,4100,350);
        image(guitare,5650,290);
        mechant.toutpourleCrabe();
        mechant2.toutpourleCrabe();
        pic1.physique(); 
        pic11.physique();
        pic12.physique();
        joueur.update();
        if(isPlaying1==false){
          musique1.loop();
          isPlaying1=true;
        }
        //Dès la coordonnées du joueur en x devient supérieur à déclencheur, le boss apparait et le combat commence
        if(joueur.x>declencheur){
          if(isPlayingboss1==false){
            musique1.stop();
            musique_requin.loop();
            isPlayingboss1=true;
          }
          toutPourLeRequin();
        }
      }
    }    
    else {
      cinematique();
    }   
  }
  
  //NIVEAU 2
  if(lvl==2) {
    if (cinema == false){
      affiche_decor(lvl);
      if(joueur.y>700) nbvie=0; 
      ath();
      if(nbvie>0){
        scroller(lvl);
        rec0lvl2.physique(joueur.x);
        hauteur1.physique(joueur.x);  
        hauteur2.physique(joueur.x);
        hauteur3.physique(joueur.x);
        hauteur4.physique(joueur.x);
        hauteur5.physique(joueur.x);
        hauteur6.physique(joueur.x);
        hauteur7.physique(joueur.x);
        hauteur8.physique(joueur.x);
        hauteur9.physique(joueur.x);
        hauteur9aide.physique(joueur.x);
        hauteur10.physique(joueur.x);
        zoneBoss2.physique(joueur.x); 
        image(fondlvl2,150,400);
        image(fondlvl2,390,400);
        image(fondlvl2,600,400);
        image(fondlvl2,850,400);
        image(pfleche,950,435);
        image(pdanger,2528,440);
        image(liane,1330,490);
        image(herbe,2869,460);
        image(herbe,3059,460);
        image(herbe,3359,460);
        image(herbe,3659,460);
        image(herbe,3959,460);
        image(herbe,4259,460);
        image(herbe,3559,460);
        image(herbe,3859,460);
        image(herbe,4159,460);
        image(herbe,4459,460);
        image(herbe,4759,460); 
        image(liane,1730,390);
        image(ptomber,5150,494);
        image(petitliane1,2440,225);
        image(petitliane1,3040,225);
        image(petitliane1,3770,225);
        image(petitliane1,4430,225);
        image(lianeseul,5170,100);  
        pic.physique();
        toc2.physique();
        liquide1.physique2();  
        tangue1.toutpourleTangue();
        tangue2.toutpourleTangue();
        savate.lancer();
        a_manger.afficher();
        a_manger.physique();
        joueur.update();
        if(isPlaying2==false){
            musique2.loop();
            isPlaying2=true;
        }
        //Dès la coordonnées du joueur en x devient supérieur à déclencheur2, le boss apparait et le combat commence
        if (joueur.x>declencheur){
          if(isPlayingboss2==false){
            musique2.stop();
            musique_araignee.loop();
            isPlayingboss2=true;
          }
          savate.phase=1;  //Lorsque savate.phase a pour valeur 1, le  lancer de savate se fait vers le haut
          toutPourAraignee();
        }        
      }
    }
    else cinematique();
    
  }
  
  //NIVEAU 3
  if(lvl == 3) {
    if(nbvie>0){
      background(0);
      scroller(lvl);
      affiche_decor(lvl);
      all_plateforme();
      all_mal();
      savate.lancer();
      ath();
      a_manger.afficher();
      a_manger.physique();
      joueur.update();
      if(isPlaying3==false){
        musique3.loop();
        isPlaying3=true;
      }
         
      
      if (joueur.y > 7000) {  //Lorsque la coordonnée du joueur en y devient supérieur à 7000,
        lvl++;                //on passe au niveau suivant
        musique3.stop();
        screamer.play();
        joueur.x = 400;       //et les coordonnées du joueur sont réinitialisées
        joueur.y = 0;
        nbvie = 3;
      }
    }   
  }
  
  //Niveau 4 : BOSS DE FIN
  if(lvl == 4) {
    if(nbvie>0 && kal.pv>0){ 
      affiche_decor(lvl);
      toutPourgmk();      
      savate.lancer();
      ath();
      joueur.update();
    }
     if(kal.pv<=0) {
       toutPourgmk();
       if (frameCount-kal.framefin > 500){
         lvl=0;
         reinitialisation(lvl);
       }
     }
  }
  
  //GAME OVER
  if(nbvie==0){
    background(100,100,100);
    fill(255);
    textSize(100);
    text("GAME OVER", 300 ,height/2);
    textSize(40);
    text("Appuyez sur ESPACE pour recommencer", 220, 2*height/3);
    musique1.stop();
    musique2.stop();
    musique3.stop();
    musique_requin.stop();
  }
}
