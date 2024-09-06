//Necessário instalar bibliotecas: SOUND
//Ocean of Dunes: The Lost Treasure
//tu tem que salvar os choppp e tomar cuidado com afogamento/homem-peixe
int screen;
PImage imgInicial, imgInfo, imgGame;
PImage bPlayHover, bInfoHover;

int currentFrame;
PImage p1, p2, c1, c2, s1, s2;




void setup() {
  size(700, 500); //valor da tela inicial
  PImage icon = loadImage("icon.jpg");
  surface.setIcon(icon);
  surface.setTitle("Dune Game by Ingryd");

  imgInicial = loadImage("telaInitial.png");
  imgInfo = loadImage("telaInfo.png");
  bPlayHover = loadImage("buttonPlay.png");
  bInfoHover = loadImage("buttonInfo.png");

  p1 = loadImage("assets/s-luffyf1.png");
  p2 = loadImage("assets/s-luffyf2.png");
  c1 = loadImage("assets/s-chopper1.png");
  c2 = loadImage("assets/s-chopper2.png");
  s1 = loadImage("assets/s-peixao1.png");
  s2 = loadImage("assets/s-peixao1.png");
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
    gamePlay();//Game
  } else if (screen == 2) {
    image(imgInfo, 0, 0, width, height);
    //voltar
    if (mousePressed)
      if (mouseX >= 14 && mouseX <= 14+168 && mouseY >= 12 && mouseY <= 12+42) {
        screen = screen - screen;  // Botão de voltar para menu
      }
  } else if (screen == 3) {
    //global pause
  }
}
