//Necessário instalar bibliotecas: SOUND
//Ocean of Dunes: The Lost Treasure (ideia)
int screen, score;
int counter = 0;

boolean gameIsPaused = false, gameOver = false;
PImage imgInicial, imgInfo1, imgInfo2, imgInfo3, imgInfo4, imgGame, imgPause;
PImage bPlayHover, bInfoHover;
PFont gameScore;


void setup() {
  size(700, 500); //valor da tela inicial

  PImage icon = loadImage("icon.jpg");
  gameScore = createFont("data/PixelifySans-Bold.ttf", 30);
  surface.setIcon(icon);
  surface.setTitle("Dune Game by Ingryd");

  imgInicial = loadImage("telaInitial.png");
  imgInfo1 = loadImage("assets/telaInfo1.png");
  imgInfo2 = loadImage("assets/telaInfo2.png");
  imgInfo3 = loadImage("assets/telaInfo3.png");
  imgInfo4 = loadImage("assets/telaInfo4.png");
  imgGame = loadImage("assets/mainGame.png");
  bPlayHover = loadImage("buttonPlay.png");
  bInfoHover = loadImage("buttonInfo.png");

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


  if (screen == 0) {
    image(imgInicial, 0, 0, width, height);
    //Hover interaction
    if (mouseX >= 250 && mouseX <= 450 && mouseY >= 270 && mouseY <= 320) {
      image(bPlayHover, 245, 270); //tive que alterar a posição pra preencher
    }

    if (mouseX >= 250 && mouseX <= 450 && mouseY >= 340 && mouseY <= 390) {
      image(bInfoHover, 245, 335); //tive que alterar a posição pra preencher
    }

    //Click event
    if (mousePressed) {
      // Verifica se o mouse está dentro da área específica para mudar a tela
      if (mouseX >= 250 && mouseX <= 450 && mouseY >= 270 && mouseY <= 320) {
        screen = 1;  // Muda para a tela do jogo
      }

      if (mouseX >= 250 && mouseX <= 450 && mouseY >= 340 && mouseY <= 390) {
        screen = 2;  // Muda para tela de info
      }
    }
  } else if (screen == 1) {
    if (gameIsPaused) {
      drawPauseScreen(); // Desenha a tela de pausa se o jogo estiver pausado
    } else {
      gamePlay(); // Atualiza e desenha o jogo se não estiver pausado
    }
  } else if (screen == 2) {


    if (counter == 0) {
      image(imgInfo1, 0, 0, width, height);
      if (mousePressed) {
        if (mouseX >= 600 && mouseX <= 630 && mouseY >= 232 && mouseY <= 232 + 30) {
          if (lastMousePressed != mousePressed) {
            counter++;
            lastMousePressed = mousePressed;
        }
      }
      if (counter == 1) {
        image(imgInfo2, 0, 0); // proxima image
        if (mousePressed) {
          if (mouseX >= 600 && mouseX <= 630 && mouseY >= 232 && mouseY <= 232 + 30) {
            if (lastMousePressed != mousePressed) {
            counter++;
            lastMousePressed = mousePressed;
          }
        }

        if (counter == 2) {
          image(imgInfo3, 0, 0); // Display the third image
          counter++;
        } else if (counter == 3) {
          image(imgInfo4, 0, 0); // Display the fourth image
        }
      }
      println(counter);

      // Voltar
      if (mousePressed) {
        if (mouseX >= 14 && mouseX <= 14 + 168 && mouseY >= 12 && mouseY <= 12 + 42) {
          screen = 0;  // Botão de voltar para menu
        }
      }
    }
  }
}
