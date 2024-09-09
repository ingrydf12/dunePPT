//Necessário instalar bibliotecas: SOUND
//Ocean of Dunes: The Lost Treasure (ideia)
int screen, score = 0;
int counter = 0, life = 3;
PImage heart;

boolean gameIsPaused = false, gameOver = false;
PImage title, imgInfo1, imgInfo2, imgInfo3, imgInfo4, imgGame, imgPause, imgOver;
PImage bPn, bIn, bPlayAgainH, bMenuH, bPlayHover, bInfoHover;
PFont gameScore;

boolean lastMousePressed = false;
boolean clicou = false;

//parallax menu
PImage bg, fg;
float bgX = 0;
float fgX = 0;

void setup() {
  size(700, 500);

  PImage icon = loadImage("icon.jpg");
  gameScore = createFont("data/xilosa_.ttf", 24);
  surface.setIcon(icon);
  surface.setTitle("Dune Game by Ingryd");

  //MARK: - Images
  imgInfo1 = loadImage("assets/telaInfo1.png");
  imgInfo2 = loadImage("assets/telaInfo2.png");
  imgInfo3 = loadImage("assets/telaInfo3.png");
  imgInfo4 = loadImage("assets/telaInfo4.png");
  imgGame = loadImage("assets/mainGame.png");
  imgOver = loadImage("gameOver.png");
  bPn = loadImage("interactions/buttonPlayN.png");
  bIn = loadImage("interactions/buttonInfoN.png");
  title = loadImage("data/menu/title.png");
  bPlayAgainH = loadImage("interactions/bPlayAgainH.png");
  bMenuH = loadImage("interactions/bMenuH.png");
  bPlayHover = loadImage("interactions/buttonPlay.png");
  bInfoHover = loadImage("interactions/buttonInfo.png");

  heart = loadImage("data/assets/s-heart.png");

  bg = loadImage("data/menu/background.png");
  fg = loadImage("data/menu/foreground.png");

  posx = width/2;
  posy = height/2 + 200;

  //Player
  for (int i = 0; i< filenames.length; i++) {
    sprites[i] = loadImage(folder + filenames[i]);
  }

  //Shark
  for (int i = 0; i< fileShark.length; i++) {
    spriteShark[i] = loadImage(folderShark + fileShark[i]);
  }

  //Chop
  for (int i = 0; i< fileChop.length; i++) {
    spriteChop[i] = loadImage(folderChop + fileChop[i]);
  }
}

void draw() {
  //Parallax -> o foreground se move em loop com certa velocidade
  if (screen == 0) {
    menu();
  } else if (screen == 1) {
    if (gameIsPaused) {
      drawPauseScreen(); // Desenha a tela de pausa se o jogo estiver pausado
    } else {
      gamePlay(); // Atualiza e desenha o jogo se não estiver pausado
      drawLives();
    }
  } else if (screen == 2) {
    carrosselImg();
    // Voltar
    if (mousePressed) {
      if (mouseX >= 14 && mouseX <= 14 + 168 && mouseY >= 12 && mouseY <= 12 + 42) {
        screen = 0;  // Botão de voltar para menu
      }
    }
  } else if (screen == 4) {
    gameOverScreen();
  }
}
