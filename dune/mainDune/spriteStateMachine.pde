//MARK: - PLAYER
String[] filenames = {"s-luffyf1.png", "s-luffyf2.png"}; // aniamção player
String folder = "data/sprites/player/"; //pasta das img
PImage[] sprites = new PImage[filenames.length]; //negocio q vai armazenar os sprites

// MARK: - CHOP
String[] fileChop = {"s-chopper1.png", "s-chopper2.png"}; // aniamção chop
String folderChop = "data/sprites/chop/"; //pasta das img
PImage[] spriteChop = new PImage[fileChop.length];

// MARK: - Homem-peixe (shark)
String[] fileShark = {"s-peixao1.png", "s-peixao2.png"}; // aniamção chop
String folderShark = "data/sprites/peixe/"; //pasta das img
PImage[] spriteShark = new PImage[fileShark.length];

// player
float posx, posy;
int dirx, diry; 

//peixao
int sharkX = int(random(width)), sharkY = 0;

// chop
int chopX = int(random(width)), chopY = 0;
