//todas as imagens, botões e fonte
PImage telaInicial, telaGame, telaInfo, buttonPlay, buttonInfo, winImage, destroyImg;
PImage bNeo, bTrin, bMorp, bOrac, bPC, altPC;
PFont cinzel, cinzelB;

int screen;
int userInput = -1;
float cpu;

void setup() {
  size(1250, 874); //Tamanho da tela inicial
  //Carregando todos os assets
  cinzel = createFont("assets/CinzelDecorative-Regular.otf", 30);
  cinzelB = createFont("assets/CinzelDecorative-Bold.otf", 30);
  telaInicial = loadImage("assets/screen/screenInicial.png");
  telaInfo = loadImage("assets/screen/infoScreen.png");
  buttonPlay = loadImage("assets/screen/buttonJogar.png");
  buttonInfo = loadImage("assets/screen/buttonInfo.png");
  telaGame = loadImage("assets/screen/mainGame.png");
  bNeo = loadImage("assets/buttons/buttonNeo.png");
  bTrin = loadImage("assets/buttons/buttonTrin.png");
  bMorp = loadImage("assets/buttons/buttonMorp.png");
  bOrac = loadImage("assets/buttons/buttonOrac.png");
  bPC = loadImage("assets/buttons/buttonPc.png");
  winImage= loadImage("assets/winConfetti.png");
  destroyImg = loadImage("assets/destroy.gif");
  altPC = loadImage("assets/buttons/altPC.png"); //somente para MainGame
  textFont(cinzelB);
}

void draw() {
  background(255);

  //Interface Menu
  if (screen == 0) {
    image(telaInicial, 0, 0);
    //As posições dos botões eu usei a ferramenta de régua no Figma para setar x e y
    image(buttonPlay, 400, 500);
    image(buttonInfo, 410, 600);

    if (mousePressed) {
      if (mouseX >= 400 && mouseX <= 400 + 400 && mouseY >= 500 && mouseY <= 500 + 87) {
        screen = 1;
        if (mouseX >= 400 && mouseX <= 400 + 400 && mouseY >= 500 && mouseY <= 500 + 87) {
          screen = 1;
          // pra reiniciar o jogo toda vez que sair da tela
          userInput = -1;
          cpu = int(random(0, 5));
        }
      }

      //Botão Info
      if (mouseX >= 410 && mouseX <= 410 + 400 && mouseY >= 600 && mouseY <= 600 + 87) {
        screen = 2;
      }
    }
  }

  //Interface Main Game
  if (screen == 1) {
    image(telaGame, 0, 0);

    //Botão de voltar
    if (mousePressed) {
      if (mouseX >= 56 && mouseX <= 56 + 37 && mouseY >= 63 && mouseY <= 63 + 42) {
        screen = 0; // Volta para a tela inicial
      }
    }

    if (userInput != -1) {
      verificarVencedor();
      text("Para reiniciar o jogo, volte para a tela inicial.",200,800);
    } else {
      desenharBotoes();
      text("Escolha um personagem para lutar.", 300,800);
    }
  }

  if (screen == 2) {
    image(telaInfo, 0, 0);

    if (mousePressed) {
      if (mouseX >= 56 && mouseX <= 56 + 37 && mouseY >= 63 && mouseY <= 63 + 42) {
        screen = 0; // Volta para a tela inicial
      }
    }
  }
}


//Interação com os botões do Main Game
void mousePressed() {
  if (mouseX >= 60 && mouseX <= 60 + 240 && mouseY >= 560 && mouseY <= 560 + 240) userInput = 0;
  else if (mouseX >= 300 && mouseX <= 300 + 240 && mouseY >= 560 && mouseY <= 560 + 240) userInput = 1;
  else if (mouseX >= 540 && mouseX <= 540 + 240 && mouseY >= 560 && mouseY <= 560 + 240) userInput = 2;
  else if (mouseX >= 780 && mouseX <= 780 + 240 && mouseY >= 560 && mouseY <= 560 + 240) userInput = 3;
  else if (mouseX >= 1020 && mouseX <= 1020 + 240 && mouseY >= 560 && mouseY <= 560 + 240) userInput = 4;
}

void verificarVencedor() {

  //Neo
  if (userInput == 0) {
    fill(255);
    if (cpu == 1 || cpu == 3) {
      fill(255);
      text("O maioral desviou de todas as balas. Você venceu.", 250, 200);
      image(bNeo, 500, 250);
    } else if (cpu == 2 || cpu == 4) {
      text("Não deu pro escolhido. " + getChoiceName(int(cpu)) + " vence com precisão.", 190, 200);
      image(destroyImg, 390, 220, 400, 200);
    } else {
      text("Empate.", 370, 200);
    }
  }
  //Trinity
  if (userInput == 1) {
    if (cpu == 2 || cpu == 4) {
      text("Trinity vence " + getChoiceName(int(cpu)) + ". Você venceu!", 300, 200);
      image(bTrin, 500, 250);
    } else if (cpu == 0 || cpu == 3) {
      text(getChoiceName(int(cpu)) + "foi mais forte que você. Trinity perdeu.", 250, 200);
      image(destroyImg, 390, 220, 400, 200);
    } else {
      text("Empate. Melhor tentar de novo.", 300, 200);
    }
  }

  //Morpheus
  if (userInput == 2) {
    if (cpu == 0 || cpu == 3) {
      text("Morpheus ataca novamente. Você venceu!", 250, 200);
      image(bMorp, 500, 250);
    } else if (cpu == 1 || cpu == 4) {
      text("Parece que " + getChoiceName(int(cpu)) + " não deu chances. Você perdeu.", 190, 200);
      image(destroyImg, 390, 220, 400, 200);
    } else {
      text("Empate.", 400, 200);
    }
  }

  //Oraculo
  if (userInput == 3) {
    if (cpu == 1 || cpu == 4) {
      text("Oraculo vence. Receba a inteligência.", 300, 200);
      image(bOrac, 500, 250);
    } else if (cpu == 0 || cpu == 2) {
      text(getChoiceName((int)cpu) + " te mostrou que saber tudo é perder tudo. Você perdeu.", 90, 200);
      image(destroyImg, 390, 220, 400, 200);
    } else {
      text("Empate.", 400, 200);
    }
  }

  //errorTelaAzul
  if (userInput == 4) {
    if (cpu == 0 || cpu == 2) {
      image(altPC, 460, 250);
      text("Você tem todos os dados. Você destruiu seu oponente.", 160, 200);
    } else if (cpu == 1 || cpu == 3) {
      text("Vish... " + getChoiceName((int)cpu) + " fez a máquina e a quebrou.", 220, 200);
      image(destroyImg, 390, 220, 400, 200);
    } else {
      text("Eeeempate.", 400, 200);
    }
  }
}
