//Définition de la classe plateforme

class Plateforme {
  int x;
  int y;
  int l;
  int h;
  
  Plateforme(int absp,int ordp,int larg, int haut){
    x = absp;
    y = ordp;
    l = larg;
    h = haut;
  }
  
  
  void physique(int xperso){
    fill(couleurPlate(lvl));
    rect(x,y,l,h);
    if (xperso > x-20 && xperso < x+l+20){
      if (joueur.y+perso.height/2 >= y+20 && joueur.y+perso.height/2 <= y+30) {
        joueur.y += -G;

        njump = 0;
      }
      if (joueur.y+perso.height/2 > y+60 && joueur.y+perso.height/2 <= y+h) {
        if (xperso < x+l/2) joueur.x = x-20;
        else joueur.x = x+l+20;
      }
    }
  }
}


color couleurPlate(int n) {
  color coul = color(255, 222, 117);
  if (n == 2) coul = color(86, 62, 34);
  else if (n == 3) coul = color(110, 11, 20);
  else if (n == 4) coul = color(44, 3, 11);
  return coul;
}
