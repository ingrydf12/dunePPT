//Necessário instalar bibliotecas: SOUND and Sprites
//Ocean of Dunes: The Lost Treasure
//tu tem que salvar os choppp e tomar cuidado com afogamento/homem-peixe
int screen;
PImage imgInicial, imgInfo;
PImage bPlayHover, bInfoHover;


void setup() {
  size(700, 500); //valor da tela inicial
  PImage icon = loadImage("icon.jpg");
  surface.setIcon(icon);
  surface.setTitle("Dune Game by Ingryd");

  imgInicial = loadImage("telaInitial.png");
  imgInfo = loadImage("telaInfo.png");
  bPlayHover = loadImage("buttonPlay.png");
  bInfoHover = loadImage("buttonInfo.png");
}

void draw() {
  if (screen == 0) {
    image(imgInicial, 0, 0, width, height);
    mousePressed();
  } else if (screen == 1) {
    background(255);
    // Desenha a tela do jogo
    // image(imgGame, 0, 0, width, height); // Substitua pelo código de desenho da tela do jogo
  } else if (screen == 2){
    image(imgInfo, 0,0, width, height);
  }
}

void mousePressed() {
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
    
    //voltar
    if (mouseX >= 14 && mouseX <= 14+168 && mouseY >= 12 && mouseY <= 12+42) {
      screen = screen - screen;  // Botão de voltar para menu
    }
  }
}
