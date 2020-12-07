// Définitions des images et du son

void def_image(){
  menu = loadImage("background/image_gmk.png");
  
  decor[1] = loadImage("background/plage_d.png");
  decor[2] = loadImage("background/foret_d.png");
  decor[3] = loadImage("background/volcan_d.png");
  decor[4] = loadImage("background/grotte_d.png");
  finjeu = loadImage("background/fin_d.png");
  
  cine[1][0] = loadImage("cine/cine0.png");
  cine[1][1] = loadImage("cine/cine1.png");
  cine[1][2] = loadImage("cine/cine2.png");
  cine[1][3] = loadImage("cine/cine3.png");
  cine[1][4] = loadImage("cine/cine4.png");
  
  cine[2][0] = loadImage("cine/cine21.png");
  cine[2][1] = loadImage("cine/cine22.png");
  cine[2][2] = loadImage("cine/cine23.png");
  cine[2][3] = loadImage("cine/cine24.png");
  cine[2][4] = loadImage("cine/cine25.png");
  
  avancer = loadImage("item/tuto/droite.png");
  reculer = loadImage("item/tuto/gauche.png");
  lancer = loadImage("item/tuto/lancesavate.png");
  baisser = loadImage("item/tuto/accroupi.png");
  sauter = loadImage("item/tuto/saut.png");
  
  pastouche[1] = loadImage("item/interaction/oursin.png");
  pastouche[2] = loadImage("item/interaction/ronce.png");
  pastouche[3] = loadImage("item/interaction/lava.png");
  pastouche[4] = loadImage("item/interaction/oursin.png");
  pastouche[5] = loadImage("item/interaction/liquide.png");
  aura = loadImage("item/interaction/horas.png");
  savat2doi = loadImage("item/interaction/savate.png");
  vie = loadImage("item/interaction/coeur.png");
  spriteSheet = loadImage("item/interaction/crabe1.png");
  mechantangue= loadImage("item/interaction/tangue.png");
  samoussa1 = loadImage("item/interaction/samoussa.png"); 
  samoussa2 = loadImage("item/interaction/samoussa2.png");
  samoussa = samoussa1;
  pain_bouchon=loadImage("item/interaction/pain_bouchon.png");
  cot=loadImage("item/interaction/cot.png");
  
  perso_neutre = loadImage("perso/perso_neutre.png");
  perso_neutreg = loadImage("perso/perso_neutreL.png");
  perso_courtd = loadImage("perso/perso_Rrun.png");
  perso_courtd2 = loadImage("perso/perso_Rrun2.png");
  perso_courtg = loadImage("perso/perso_Lrun.png");
  perso_courtg2 = loadImage("perso/perso_Lrun2.png");
  perso_saute = loadImage("perso/perso_jump.png");
  perso_assis = loadImage("perso/perso_assis.png"); perso = perso_neutre;
  
  requin_normal = loadImage("boss/req3v4.png");
  requin_ouch = loadImage("boss/req3frame2.png");
  Irequin = loadImage("boss/req3v4.png");
  vague = loadImage("boss/vague.png");
  projoReq = loadImage("boss/projoReq.png");
  Iaraignee=loadImage("boss/bossaraignee.png");
  projoAr=loadImage("boss/projoAr.png");
  
  araignee_normale=loadImage("boss/bossaraignee.png");
  araignee_ouch = loadImage("boss/bossaraigneeouch.png");
  projoAr=loadImage("boss/projoAr.png");
  araignee_rage=loadImage("boss/bossaraigneeenrage.png");
  
  gmknormal = loadImage("boss/witch.png");
  gmkbobo = loadImage("boss/witch2.png"); 
  gmk = gmknormal;
  sphere = loadImage("boss/sphere.png");
  laser = loadImage("boss/laser.png");
  
  palmier1 =loadImage("item/deco/palmier1.png");
  palmier2=loadImage("item/deco/palmier2.png");
  palmier3=loadImage("item/deco/palmier3.png");
  petitmaison =loadImage("item/deco/petitmaison.png");
  fauteille =loadImage("item/deco/fauteille.png");
  fauteille2=loadImage("item/deco/fauteille2.png");
  hamac=loadImage("item/deco/hamac.png");
  surf=loadImage("item/deco/surf.png");
  guitare=loadImage("item/deco/guitare.png");
  liane =loadImage("item/deco/liane.png");
  herbe= loadImage("item/deco/herbe.png");
  pfleche=loadImage("item/deco/pfleche.png");
  ptomber=loadImage("item/deco/ptomber.png");
  pdanger= loadImage("item/deco/pdanger.png");
  fondlvl2=loadImage("item/deco/decorlvl2.png");
  petitliane1=loadImage("item/deco/lianepetit.png");
  lianeseul=loadImage("item/deco/lianeseul.png");
  liane =loadImage("item/deco/liane.png");
}

void def_son(){
  intro = new SoundFile(this,"audio/titre.mp3");
  
  musique1 = new SoundFile(this,"audio/musiques/level1.mp3");
  musique2 = new SoundFile(this,"audio/musiques/level2.mp3");
  musique3 = new SoundFile(this,"audio/musiques/level3.mp3");
  musique_requin = new SoundFile(this,"audio/musiques/musique_requin.mp3");
  musique_araignee = new SoundFile(this,"audio/musiques/musique_araignee.mp3");
  
  cri = new SoundFile(this,"audio/bruitages/bobo1.mp3");
  manger = new SoundFile(this,"audio/bruitages/manger.mp3");
  boire = new SoundFile(this,"audio/bruitages/cot.mp3");
  bruitSavate = new SoundFile(this,"audio/bruitages/savate.mp3");
  crabe = new SoundFile(this,"audio/bruitages/crabe.mp3");
  bruitMonstre=new SoundFile(this,"audio/bruitages/monstre1.mp3");
  screamer = new SoundFile(this,"audio/bruitages/nyahahah.mp3");
  ricanement = new SoundFile(this,"audio/bruitages/sorciere1.mp3");
  cridouleur = new SoundFile(this,"audio/bruitages/gmkouch.mp3");
  
  replik[1][0] = new SoundFile(this,"audio/cinematiques/cine1_1.mp3");
  replik[1][1] = new SoundFile(this,"audio/cinematiques/cine1_2.mp3");
  replik[1][2] = new SoundFile(this,"audio/cinematiques/cine1_3.mp3");
  replik[1][3] = new SoundFile(this,"audio/cinematiques/cine1_4.mp3");
  replik[1][4] = new SoundFile(this,"audio/cinematiques/cine1_5.mp3");
  replik[2][0] = new SoundFile(this,"audio/cinematiques/cine2_1.mp3");
  replik[2][1] = new SoundFile(this,"audio/cinematiques/cine2_2.mp3");
  replik[2][2] = new SoundFile(this,"audio/cinematiques/cine2_3.mp3");
  replik[2][3] = new SoundFile(this,"audio/cinematiques/cine2_4.mp3");
  replik[2][4] = new SoundFile(this,"audio/cinematiques/cine2_5.mp3");
}
