SoundFile[][] replik = new SoundFile[4][5];

int ncine = 0;
int actframe = 0;
int duree_affichage = 300;

Boolean cinema = true;
Boolean playIntroSound=true;

PImage[][] cine = new PImage[4][5];

//fonction qui affiche les image des cinématiques
void affiche_cine(int k){
  imageMode(CORNER);
  image(cine[lvl][k],0,0);
  imageMode(CENTER);
}

//fonction qui joue la cinematique (image + son)
void cinematique(){
  affiche_cine(ncine);
  if(playIntroSound==true){
    replik[lvl][ncine].play();
    playIntroSound=false;
  }
  if (lvl==1){
    if (ncine==2) duree_affichage = 500;
    if (frameCount-actframe >= duree_affichage){
      ncine++;
      playIntroSound=true;
      actframe = frameCount;     
    }
  }
  if (lvl==2){
    duree_affichage = 500;
    if (frameCount-actframe >= duree_affichage){
      ncine++;
      playIntroSound=true;
      actframe = frameCount;     
    }
  } 
  if (ncine == cine[lvl].length){
    cinema=false;
    ncine = 0;
    playIntroSound=true;
  }
}
